terraform {
  backend "gcs" {
    bucket = "abhinay-test"
    prefix = "terraform/env-tfstate"
    credentials = "./key.json"
  }
}   