resource "google_artifact_registry_repository" "repositories" {
  for_each = var.repositories

  repository_id = each.key  # This is the required argument for the repository name
  format        = each.value.format
  location      = each.value.location
  project       = var.project
}