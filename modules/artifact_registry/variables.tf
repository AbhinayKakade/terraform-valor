variable "project" {
  description = "The Google Cloud project ID where the Artifact Registry repositories will be created."
  type        = string
}

variable "repositories" {
  description = "A map of Artifact Registry repositories to be created."
  type = map(object({
    format   = string
    location = string
  }))
  default = {
    "data-science-notebooks" = {
      format   = "DOCKER"
      location = "us-central1"
    },
    "exegete" = {
      format   = "DOCKER"
      location = "us-central1"
    },
    "gcf-artifacts" = {
      format   = "DOCKER"
      location = "us-central1"
    },
    "raw-event-handler-dev-cloudfx" = {
      format   = "DOCKER"
      location = "us-central1"
    },
    "test-cloud-funcs" = {
      format   = "DOCKER"
      location = "us-central1"
    },
    "utilitatibus-scala-dev" = {
      format   = "MAVEN"
      location = "us-central1"
    },
    "valorpy" = {
      format   = "PYTHON"
      location = "us-central1"
    },
    "asia" = {
      format   = "DOCKER"
      location = "asia"
    },
    "eu" = {
      format   = "DOCKER"
      location = "europe"
    },
    "gcr" = {
      format   = "DOCKER"
      location = "us"
    },
    "us" = {
      format   = "DOCKER"
      location = "us"
    }
  }
}