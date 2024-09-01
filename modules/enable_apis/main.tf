resource "google_project_service" "my_apis" {
  for_each = toset(var.api_services)

  project = var.project
  service = each.key

  disable_on_destroy = false # Keep the service enabled even if the resource is destroyed
}
