# Google SQL Database Instance
resource "google_sql_database_instance" "main_primary" {
  name             = var.db_instance_name
  database_version = var.database_version
  project          = var.project
  region           = var.region

  settings {
    tier              = var.db_tier
    availability_type = var.availability_type
    disk_size         = var.disk_size

    ip_configuration {
      ipv4_enabled                             = var.ipv4_enabled
      private_network                          = var.private_network
      enable_private_path_for_google_cloud_services = var.enable_private_path_for_google_cloud_services
    }

    backup_configuration {
      enabled                        = var.backup_enabled
      point_in_time_recovery_enabled = var.point_in_time_recovery_enabled
      transaction_log_retention_days = var.transaction_log_retention_days
      location                       = var.backup_location

      backup_retention_settings {
        retention_unit   = var.retention_unit
        retained_backups = var.retained_backups
      }
    }

    maintenance_window {
      day  = var.maintenance_window_day
      hour = var.maintenance_window_hour
    }
  }

  deletion_protection = var.deletion_protection

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

# Private Services Connection for Cloud SQL
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.network
  service                 = var.service
  reserved_peering_ranges = [google_compute_global_address.private_vpc_range.name]
}

# Reserve a Range for the Private VPC Connection
resource "google_compute_global_address" "private_vpc_range" {
  name          = var.private_vpc_range_name
  purpose       = var.purpose
  address_type  = var.address_type
  prefix_length = var.prefix_length
  network       = var.network
  project       = var.project
}

# PostgreSQL Databases
resource "google_sql_database" "main" {
  for_each = toset(var.database_names)
  name     = each.value
  instance = google_sql_database_instance.main_primary.name
  project  = var.project
}

# Random Integer for Unique DB Names
resource "random_integer" "make_db_name_unique" {
  min = var.random_integer_min
  max = var.random_integer_max
}

# Random Password for PostgreSQL Users
resource "random_string" "random" {
  length  = var.password_length
  special = var.password_special
}

# PostgreSQL Users
resource "google_sql_user" "db_users" {
  for_each = toset(var.usernames)
  name     = each.value
  instance = google_sql_database_instance.main_primary.name
  password = random_string.random.result
  project  = var.project
}

# Secret Manager Secrets
resource "google_secret_manager_secret" "postgres_secrets" {
  for_each = toset(var.usernames)

  secret_id = "${each.value}-secret"
  project   = var.project

  replication {
    user_managed {
      replicas {
        location = var.secret_location
      }
    }
  }
}

# Secret Manager Secret Versions
resource "google_secret_manager_secret_version" "postgres_secrets_versions" {
  for_each  = toset(var.usernames)
  secret    = google_secret_manager_secret.postgres_secrets[each.value].id
  secret_data = google_sql_user.db_users[each.value].password
}

# IAM Permissions for Secret Manager
resource "google_service_account" "postgres_sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = var.project
}

resource "google_secret_manager_secret_iam_member" "secret_access" {
  for_each  = toset(var.usernames)
  secret_id = google_secret_manager_secret.postgres_secrets[each.value].id
  role      = var.secret_manager_role
  member    = "serviceAccount:${google_service_account.postgres_sa.email}"
  depends_on = [google_secret_manager_secret.postgres_secrets]
}
