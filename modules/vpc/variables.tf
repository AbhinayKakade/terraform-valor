variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "default"
}

variable "auto_create_subnetworks" {
  description = "When set to true, auto creates subnetwork"
  type        = bool
  default     = false
}

variable "routing_mode" {
  description = "The network-wide routing mode to use. If set to 'REGIONAL', this VPC network's cloud routers will only advertise routes with subnetworks in the same region as the router. If set to 'GLOBAL', this VPC network's cloud routers will advertise routes with all subnetworks in the VPC network, regardless of region."
  type        = string
  default     = "REGIONAL"
}

variable "project" {
  description = "The ID of the project in which to create the VPC network"
  type        = string
  default     = "valor-labs-dev"
}

variable "description" {
  description = "An optional description of this resource"
  type        = string
  default     = "Default network for the project"
}

variable "delete_default_internet_gateway_routes" {
  description = "If set to true, default routes will be deleted upon network creation"
  type        = bool
  default     = false
}

variable "mtu" {
  description = "Maximum transmission unit in bytes"
  type        = number
  default     = 1460
}

variable "enable_ipv6_ula" {
  description = "Enable ULA internal IPv6 on the network"
  type        = bool
  default     = false
}

variable "internal_ipv6_range" {
  description = "The internal IPv6 range for the network"
  type        = string
  default     = null
}

variable "network_firewall_policy_enforcement_order" {
  description = "The firewall policy enforcement order for the network"
  type        = string
  default     = "AFTER_CLASSIC_FIREWALL"
}

