resource "google_alloydb_cluster" "default" {
  cluster_id       = var.alloydb_cluster_id
  location         = var.alloydb_location
  display_name     = var.alloydb_display_name
  project          = var.project
  cluster_type     = var.alloydb_cluster_type
  deletion_policy  = var.alloydb_deletion_policy
  database_version = var.alloydb_database_version

  dynamic "network_config" {
    for_each = var.alloydb_psc_enabled ? [] : [1]
    content {
      network            = var.network_name
      allocated_ip_range = var.alloydb_allocated_ip_range
    }
  }

  dynamic "psc_config" {
    for_each = var.alloydb_psc_enabled ? [1] : []
    content {
      psc_enabled = var.alloydb_psc_enabled
    }
  }

  dynamic "automated_backup_policy" {
    for_each = var.alloydb_enable_automated_backup ? [1] : []
    content {
      location      = var.alloydb_backup_location
      backup_window = "3600s"
      enabled       = var.alloydb_backup_enabled

      quantity_based_retention {
        count = var.alloydb_quantity_based_retention_count
      }
    }
  }

  dynamic "continuous_backup_config" {
    for_each = var.alloydb_continuous_backup_enabled ? [1] : []
    content {
      enabled              = var.alloydb_continuous_backup_enabled
      recovery_window_days = var.alloydb_continuous_backup_recovery_window_days
    }
  }

  dynamic "initial_user" {
    for_each = var.alloydb_initial_user != "" ? [1] : []
    content {
      user     = var.alloydb_initial_user
      password = var.alloydb_initial_user_password
    }
  }

}