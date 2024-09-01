variable "region" {
  description = "Region for the GCS bucket"
  type        = string
}

variable "project"{
    description = "poc-test-pocs"
    type        = string
}

variable "api_services" {
  description = "List of APIs to enable"
  type        = list(string)
}


#******************************************
# VPC configuration
#*****************************************


variable "auto_create_subnetworks" {
  description = "If true, subnets are automatically created. If false, no subnets are created."
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "The network-wide routing mode to use. Can be either 'GLOBAL' or 'REGIONAL'."
  type        = string
  default     = "REGIONAL"
}

variable "network_name" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}


variable "description" {
  description = "An optional description of the VPC network."
  type        = string
  default     = null
}


#******************************************
#	Subnet Variables
#*****************************************
variable "subnets" {
  type = map(object({
    subnet_ip                        = string
    subnet_region                    = string
    private_ip_google_access         = optional(string, "true")
    private_ipv6_google_access       = optional(string, "DISABLE_GOOGLE_ACCESS")
    subnet_flow_logs                 = optional(string, "false")
    subnet_flow_logs_interval        = optional(string, "INTERVAL_5_SEC")
    subnet_flow_logs_sampling        = optional(string, "0.5")
    subnet_flow_logs_metadata        = optional(string, "INCLUDE_ALL_METADATA")
    subnet_flow_logs_filter          = optional(string, "true")
    subnet_flow_logs_metadata_fields = optional(list(string), [])
    description                      = optional(string)
    purpose                          = optional(string, "PRIVATE")
    role                             = optional(string, null)
    stack_type                       = optional(string, "IPV4_ONLY")
    ipv6_access_type                 = optional(string, null)
  }))
  description = "The map of subnets being created"
}


#******************************************
#	GCS Buckets
#*****************************************

variable "buckets" {
  description = "A list of Google Cloud Storage buckets with their configurations."
  type = list(object({
    name              = string
    location          = string
    storage_class     = string
    versioning        = optional(bool)
    lifecycle_rules   = optional(list(object({
      action_type           = string
      age                   = optional(number)
      created_before        = optional(string)
      with_state            = optional(string)
      matches_storage_class = optional(list(string))
      num_newer_versions    = optional(number)
    })))
    logging          = optional(list(object({
      log_bucket        = string
      log_object_prefix = optional(string)
    })))
    cors             = optional(list(object({
      max_age_seconds = optional(number)
      method          = list(string)
      origin          = list(string)
      response_header = optional(list(string))
    })))
  }))
}

/******************************************
 Artifact Registry Repositories Definition
 *****************************************/

variable "repositories" {
  description = "A map of Artifact Registry repositories to be created."
  type = map(object({
    format   = string
    location = string
  }))
  default = {
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
}


#*****************************************
# POSTGRES
#*****************************************

variable "db_instance_name" {
  type = string
}

variable "database_version" {
  type = string
}

variable "prevent_destroy" {
  type = bool
}

variable "db_tier" {
  type = string
}

variable "availability_type" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "ipv4_enabled" {
  type = bool
}

variable "private_network" {
  type = string
}

variable "enable_private_path_for_google_cloud_services" {
  type = bool
}

variable "backup_enabled" {
  type = bool
}

variable "point_in_time_recovery_enabled" {
  type = bool
}

variable "transaction_log_retention_days" {
  type = number
}

variable "backup_location" {
  type = string
}

variable "retention_unit" {
  type = string
}

variable "retained_backups" {
  type = number
}

variable "maintenance_window_day" {
  type = number
}

variable "maintenance_window_hour" {
  type = number
}

variable "deletion_protection" {
  type = bool
}

variable "network" {
  type = string
}

variable "service" {
  type = string
}

variable "private_vpc_range_name" {
  type = string
}

variable "purpose" {
  type = string
}

variable "address_type" {
  type = string
}

variable "prefix_length" {
  type = number
}

variable "database_names" {
  type = list(string)
}

variable "random_integer_min" {
  type = number
}

variable "random_integer_max" {
  type = number
}

variable "password_length" {
  type = number
}

variable "password_special" {
  type = bool
}

variable "usernames" {
  type = list(string)
}

variable "secret_location" {
  type = string
}

variable "service_account_id" {
  type = string
}

variable "service_account_display_name" {
  type = string
}

variable "secret_manager_role" {
  type = string
}


#*****************************************
# AlloyDB
#*****************************************


variable "alloydb_cluster_id" {
  description = "The ID of the AlloyDB cluster."
  type        = string
}

variable "alloydb_location" {
  description = "The location where the AlloyDB cluster will be created."
  type        = string
}

variable "alloydb_display_name" {
  description = "The display name of the AlloyDB cluster."
  type        = string
}

variable "alloydb_cluster_type" {
  description = "The type of the AlloyDB cluster (e.g., PRIMARY or SECONDARY)."
  type        = string
}

variable "alloydb_deletion_policy" {
  description = "The deletion policy for the AlloyDB cluster."
  type        = string
}

variable "alloydb_database_version" {
  description = "The database version for AlloyDB."
  type        = string
}

variable "alloydb_allocated_ip_range" {
  description = "The allocated IP range for the AlloyDB cluster."
  type        = string
}

variable "alloydb_psc_enabled" {
  description = "Whether Private Service Connect (PSC) is enabled for the AlloyDB cluster."
  type        = bool
}

variable "alloydb_enable_automated_backup" {
  description = "Whether automated backups are enabled for the AlloyDB cluster."
  type        = bool
}

variable "alloydb_backup_location" {
  description = "The location where automated backups will be stored."
  type        = string
}

variable "alloydb_backup_enabled" {
  description = "Whether backups are enabled for the AlloyDB cluster."
  type        = bool
}

variable "alloydb_quantity_based_retention_count" {
  description = "The retention count for quantity-based backups."
  type        = number
}

variable "alloydb_continuous_backup_enabled" {
  description = "Whether continuous backups are enabled for the AlloyDB cluster."
  type        = bool
}

variable "alloydb_continuous_backup_recovery_window_days" {
  description = "The number of days to retain continuous backups."
  type        = number
}

variable "alloydb_initial_user" {
  description = "The initial user for the AlloyDB cluster."
  type        = string
}

variable "alloydb_initial_user_password" {
  description = "The password for the initial user."
  type        = string
}

variable "alloydb_is_secondary_cluster" {
  description = "Whether the AlloyDB cluster is a secondary cluster."
  type        = bool
}

variable "alloydb_primary_cluster_name" {
  description = "The name of the primary cluster if this is a secondary cluster."
  type        = string
}
