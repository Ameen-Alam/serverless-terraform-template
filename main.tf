provider "google" {
  credentials = "skills-online.json"
  project     = "skills-online"
  region      = "asia-east1"
}

resource "google_cloud_run_service" "skills-online" {
  name     = "skills-online"
  location = "asia-east1"

  template {
    spec {
      containers {
        image = "gcr.io/skills-online/skillsonline:${var.BUILD_NUMBER}"
      }
    }
  }

  traffic {
    percent         = 100 
    latest_revision = true
  }
}