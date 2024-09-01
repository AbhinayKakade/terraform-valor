variable "project" {
  description = "The project ID where the AlloyDB cluster will be created."
  type        = string
}

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

variable "network_name" {
  description = "The name of the VPC network."
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