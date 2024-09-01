resource "google_compute_subnetwork" "subnetwork" {
  for_each                   = var.subnets
  name                       = each.key
  ip_cidr_range              = each.value.subnet_ip
  region                     = each.value.subnet_region

  # Conditionally set private_ip_google_access based on the purpose
  private_ip_google_access   = lookup(each.value, "purpose", null) != "REGIONAL_MANAGED_PROXY" ? lookup(each.value, "subnet_private_access", "true") : "false"

  private_ipv6_google_access = lookup(each.value, "subnet_private_ipv6_access", null)

  dynamic "log_config" {
    for_each = each.value.subnet_flow_logs == "true" ? [{
      aggregation_interval = each.value.subnet_flow_logs_interval
      flow_sampling        = each.value.subnet_flow_logs_sampling
      metadata             = each.value.subnet_flow_logs_metadata
      filter_expr          = each.value.subnet_flow_logs_filter
      metadata_fields      = each.value.subnet_flow_logs_metadata_fields
    }] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
      filter_expr          = log_config.value.filter_expr
      metadata_fields      = log_config.value.metadata == "CUSTOM_METADATA" ? log_config.value.metadata_fields : null
    }
  }

  network     = var.network
  project     = var.project
  description = lookup(each.value, "description", null)

  dynamic "secondary_ip_range" {
    for_each = contains(keys(var.secondary_ranges), each.key) ? var.secondary_ranges[each.key] : []

    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  purpose          = lookup(each.value, "purpose", null)
  role             = lookup(each.value, "role", null)
  stack_type       = lookup(each.value, "stack_type", null)
  ipv6_access_type = lookup(each.value, "ipv6_access_type", null)
}
