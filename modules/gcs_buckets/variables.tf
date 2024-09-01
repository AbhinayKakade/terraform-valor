variable "buckets" {
  description = "A list of Google Cloud Storage buckets with their configurations."
  type = list(object({
    name          = string
    location      = string
    storage_class = string
    versioning    = optional(bool)
    lifecycle_rules = optional(list(object({
      action_type           = string
      age                   = optional(number)
      created_before        = optional(string)
      with_state            = optional(string)
      matches_storage_class = optional(list(string))
      num_newer_versions    = optional(number)
    })))
    logging = optional(list(object({
      log_bucket        = string
      log_object_prefix = optional(string)
    })))
    cors = optional(list(object({
      max_age_seconds = optional(number)
      method          = list(string)
      origin          = list(string)
      response_header = optional(list(string))
    })))
  }))
}

variable "project" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network to which the firewall rules will be applied."
  type        = string
}
