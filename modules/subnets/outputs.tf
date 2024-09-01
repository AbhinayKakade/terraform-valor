output "subnets" {
  value       = google_compute_subnetwork.subnetwork
  description = "The created subnet resources"
}

output "subnets_self_link" {
  value = [for subnet in google_compute_subnetwork.subnetwork : subnet.self_link]
}
