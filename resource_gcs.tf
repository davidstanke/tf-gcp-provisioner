resource "google_storage_bucket" "gcs_demo" {
    for_each = toset(var.gcp_project_ids)
    name = "${each.key}-demo-bucket"
    project = each.key
    location = var.gcs_location
}