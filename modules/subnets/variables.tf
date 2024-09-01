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


variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "network" {
  description = "The name of the VPC network"
  type        = string
}

variable "project" {
  description = "The name of the VPC network"
  type        = string
}