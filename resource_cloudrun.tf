resource "google_project_service" "run_api" {
  for_each = toset(var.gcp_project_ids)
  service  = "run.googleapis.com"
  project  = each.key
}


resource "google_cloud_run_service" "demo" {
  for_each = toset(var.gcp_project_ids)
  name     = "demo-service"
  location = var.google_region
  project  = each.key

  template {
    spec {
      containers {
        image = "gcr.io/cloud-marketplace/google/nginx:1.20"
        ports {
          container_port = 80
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true

  depends_on = [
    google_project_service.run_api,
  ]

  metadata {
    labels = {
        "created_by" : "github_davidstanke_tf-gcp-provisioner" 
        "version" : "2"
    }
  }
}

resource "google_cloud_run_service_iam_binding" "noauth" {
  for_each = toset(var.gcp_project_ids)
  location = var.google_region
  project  = each.key
  service  = "demo-service"

  role       = "roles/run.invoker"
  members    = ["allUsers"]
  depends_on = [google_cloud_run_service.demo]
}
