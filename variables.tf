variable "gcp_project_ids" {
  description = "list of the project IDs to provision resources into (example: [\"project_1\",\"project_2\"])"
  type        = list(any)
}

variable "google_region" {
  description = "GCP region in which to provision resources (example: \"us-central1\")"
  type        = string
}

variable "gcs_location" {
  description = "location for GCS buckets (example: \"US\")"
  type        = string
}