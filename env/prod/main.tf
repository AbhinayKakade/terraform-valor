#*****************************************
#	Enable APIs
#*****************************************

module "enable_apis" {
  source       = "../../modules/enable_apis"
  project      = var.project
  api_services = var.api_services
}


# ******************************************
# 	artifact registry
# *****************************************

module "artifact_registry" {
  source       = "../../modules/artifact_registry"
  project      = var.project
  repositories = var.repositories
  depends_on   = [module.enable_apis]
}


#******************************************
# VPC configuration
#*****************************************
module "vpc" {
  source                  = "../../modules/vpc"
  network_name            = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  project                 = var.project
  description             = var.description
  depends_on              = [module.artifact_registry]
}

#******************************************
# Subnet configuration
#*****************************************
module "subnets" {
  source           = "../../modules/subnets"
  project          = var.project
  network          = module.vpc.network_name
  subnets          = var.subnets
  depends_on       = [module.vpc]
}

# ******************************************
# 	GCS Buckets
# *****************************************
module "gcs_buckets" {
  source       = "../../modules/gcs_buckets"
  buckets      = var.buckets
  network_name = var.network_name
  project      = var.project
  depends_on   = [module.subnets]
}

# *****************************************
# postgres_instance
# *****************************************

module "postgres_instance" {
  source               = "../../modules/postgres"

  db_instance_name                         = var.db_instance_name
  database_version                         = var.database_version
  project                                  = var.project
  region                                   = var.region
  prevent_destroy                          = var.prevent_destroy
  db_tier                                  = var.db_tier
  availability_type                        = var.availability_type
  disk_size                                = var.disk_size
  ipv4_enabled                             = var.ipv4_enabled
  private_network                          = var.private_network
  enable_private_path_for_google_cloud_services = var.enable_private_path_for_google_cloud_services
  backup_enabled                           = var.backup_enabled
  point_in_time_recovery_enabled           = var.point_in_time_recovery_enabled
  transaction_log_retention_days           = var.transaction_log_retention_days
  backup_location                          = var.backup_location
  retention_unit                           = var.retention_unit
  retained_backups                         = var.retained_backups
  maintenance_window_day                   = var.maintenance_window_day
  maintenance_window_hour                  = var.maintenance_window_hour
  deletion_protection                      = var.deletion_protection
  network                                  = var.network
  service                                  = var.service
  private_vpc_range_name                   = var.private_vpc_range_name
  purpose                                  = var.purpose
  address_type                             = var.address_type
  prefix_length                            = var.prefix_length
  database_names                           = var.database_names
  random_integer_min                       = var.random_integer_min
  random_integer_max                       = var.random_integer_max
  password_length                          = var.password_length
  password_special                         = var.password_special
  usernames                                = var.usernames
  secret_location                          = var.secret_location
  service_account_id                       = var.service_account_id
  service_account_display_name             = var.service_account_display_name
  secret_manager_role                      = var.secret_manager_role
  depends_on                               = [module.gcs_buckets]
}


#*****************************************
# alloydb-cluster
#*****************************************


module "alloydb-cluster" {
  source = "../../modules/alloydb" 
  alloydb_cluster_id                     = var.alloydb_cluster_id
  alloydb_location                       = var.alloydb_location
  alloydb_display_name                   = var.alloydb_display_name
  alloydb_cluster_type                   = var.alloydb_cluster_type
  alloydb_deletion_policy                = var.alloydb_deletion_policy
  alloydb_database_version               = var.alloydb_database_version
  alloydb_allocated_ip_range             = var.alloydb_allocated_ip_range
  alloydb_psc_enabled                    = var.alloydb_psc_enabled
  alloydb_enable_automated_backup        = var.alloydb_enable_automated_backup
  alloydb_backup_location                = var.alloydb_backup_location
  alloydb_backup_enabled                 = var.alloydb_backup_enabled
  alloydb_quantity_based_retention_count = var.alloydb_quantity_based_retention_count
  alloydb_continuous_backup_enabled      = var.alloydb_continuous_backup_enabled
  alloydb_continuous_backup_recovery_window_days = var.alloydb_continuous_backup_recovery_window_days
  alloydb_initial_user                   = var.alloydb_initial_user
  alloydb_initial_user_password          = var.alloydb_initial_user_password
  alloydb_is_secondary_cluster           = var.alloydb_is_secondary_cluster
  alloydb_primary_cluster_name           = var.alloydb_primary_cluster_name
  project                                = var.project
  network_name                           = var.network_name
}



