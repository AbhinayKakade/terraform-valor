provider "google" {
  credentials = file("./key.json")
  region      = "us-central1"
  project     = var.project
}
 
provider "google-beta" {
  credentials = file("./key.json")
  region      = var.region
  project     = var.project
}