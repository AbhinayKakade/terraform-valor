variable "db_instance_name" {
  type = string
}

variable "database_version" {
  type = string
}

variable "project" {
  type = string
}

variable "region" {
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
