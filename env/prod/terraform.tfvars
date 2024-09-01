# common variable

region = "us-central1"
project = "abhinay-e0bb7"


#APIs to be enabled

api_services = [
  "compute.googleapis.com",
  "container.googleapis.com",
  "secretmanager.googleapis.com",
  "alloydb.googleapis.com"
]

# VPC Configuration

network_name            = "valor-network"
auto_create_subnetworks = false
routing_mode            = "REGIONAL"
description             = "Custom VPC network for project."

# Subnet Configuration

subnets = {
  "subnet-us-central1" = {
    subnet_ip             = "10.128.0.0/20"
    subnet_region         = "us-central1"
    subnet_private_access = true
  },
  "tabula-proxy-only" = {
    subnet_ip                        = "10.0.0.0/24"
    subnet_region                    = "us-central1"
    subnet_private_access            = true
    subnet_private_ipv6_access       = "DISABLE_GOOGLE_ACCESS"
    subnet_flow_logs                 = false
    subnet_flow_logs_interval        = null
    subnet_flow_logs_sampling        = null
    subnet_flow_logs_metadata        = null
    subnet_flow_logs_filter          = null
    subnet_flow_logs_metadata_fields = []
    purpose                          = "PRIVATE"
    role                             = "ACTIVE"
    stack_type                       = null
    ipv6_access_type                 = null
    secondary_ip_ranges              = []
  }
}


#	GCS Buckets


buckets = [
  {
    name              = "argos-org-files-prod-abhi"
    location          = "us-central1"
    storage_class     = "STANDARD"
    public_access     = false
    versioning        = true
    soft_delete       = true
    encryption        = "Google-managed"
    uniform_access    = true
  },
  {
    name           = "argos-version-prod-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "backup-haystack-prod-abhi"
    location       = "us-central1"
    storage_class  = "ARCHIVE"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "ce-trial-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "ce-trial-2-prod-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "combined-bq-dump-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "company_classification-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-competitor-discover-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-compliance-logs-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "dask-trial-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "data-science-vertex-notebooks-prod-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-dbt-docs-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "historical-data-pro-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "user-profile-photos-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "eratosthenes-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-fimoica-models-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = false
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-fimoica_historical_data-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "financial-metrics-prod-abhi"
    location       = "us"
    storage_class  = "COLDLINE"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-mantis-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = false
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-market-map-backup-abhi"
    location       = "us-central1"
    storage_class  = "ARCHIVE"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "runapps_default-daefhr-prod-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "solana-validator-test-prod-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-solana-warehouse-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "tegus-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = false
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-tmp-bigquery-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "utilitatibus-test-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "valor-dataproc-images-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-valor-feature-store-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "valor-labs-daisy-bkt-us-central1-proa-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "valor-labs-terraform-state-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "valor-labs-prod-cloudbuild-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "valor-os-images-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "valor_gigster_shared_data-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "vep-doug-test-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "prod-warehouse-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "zleague-valor-work-prod-abhi"
    location       = "us-central1"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  },
  {
    name           = "solana-warehouse-prod-abhi"
    location       = "us"
    storage_class  = "STANDARD"
    public_access  = false
    versioning     = true
    soft_delete    = true
    encryption     = "Google-managed"
    uniform_access = true
  }
]

# Artifact Registry


 repositories = {
  "data-science-notebooks" = {
    format   = "DOCKER"
    location = "us-central1"
  },
  "exegete" = {
    format   = "DOCKER"
    location = "us-central1"
  },
  "gcf-artifacts" = {
    format   = "DOCKER"
    location = "us-central1"
  },
  "raw-event-handler-dev-cloudfx" = {
    format   = "DOCKER"
    location = "us-central1"
  },
  "test-cloud-funcs" = {
    format   = "DOCKER"
    location = "us-central1"
  },
  "utilitatibus-scala-dev" = {
    format   = "MAVEN"
    location = "us-central1"
  },
  "valorpy" = {
    format   = "PYTHON"
    location = "us-central1"
  },
  "asia" = {
    format   = "DOCKER"
    location = "asia"
  },
  "eu" = {
    format   = "DOCKER"
    location = "europe"
  },
  "gcr" = {
    format   = "DOCKER"
    location = "us"
  },
  "us" = {
    format   = "DOCKER"
    location = "us"
  }
} 

# Postgres

db_instance_name                              = "prod-sql"
database_version                              = "POSTGRES_14"
prevent_destroy                               = false
db_tier                                       = "db-f1-micro"
availability_type                             = "ZONAL"
disk_size                                     = 10
ipv4_enabled                                  = true
private_network                               = "projects/abhinay-e0bb7/global/networks/valor-network"
enable_private_path_for_google_cloud_services = true
backup_enabled                                = true
point_in_time_recovery_enabled                = true
transaction_log_retention_days                = 7
backup_location                               = "us"
retention_unit                                = "COUNT"
retained_backups                              = 7
maintenance_window_day                        = 7
maintenance_window_hour                       = 0
deletion_protection                           = false
network                                       = "projects/abhinay-e0bb7/global/networks/valor-network"
service                                       = "servicenetworking.googleapis.com"
private_vpc_range_name                        = "private-vpc-range"
purpose                                       = "VPC_PEERING"
address_type                                  = "INTERNAL"
prefix_length                                 = 16
database_names                                = ["db1", "db2"]
random_integer_min                            = 1
random_integer_max                            = 50000
password_length                               = 12
password_special                              = false
usernames                                     = ["user1", "user2"]
secret_location                               = "us-central1"
service_account_id                            = "postgres-sa"
service_account_display_name                  = "Postgres Service Account"
secret_manager_role                           = "roles/secretmanager.secretAccessor"


# Alloydb

alloydb_cluster_id                     = "dev-alloydb-cluster"
alloydb_location                       = "us-central1"
alloydb_display_name                   = "dev-alloydb-cluster"
alloydb_cluster_type                   = "PRIMARY"
alloydb_deletion_policy                = "ABANDON"
alloydb_database_version               = "POSTGRES_15"
alloydb_allocated_ip_range             = "10.0.0.0/29"
alloydb_psc_enabled                    = true
alloydb_enable_automated_backup        = true
alloydb_backup_location                = "us-central1"
alloydb_backup_enabled                 = true
alloydb_quantity_based_retention_count = 30
alloydb_continuous_backup_enabled      = true
alloydb_continuous_backup_recovery_window_days = 7
alloydb_initial_user                   = "admin"
alloydb_initial_user_password          = "admin"
alloydb_is_secondary_cluster           = false
alloydb_primary_cluster_name           = "dev-alloydb-cluster"
