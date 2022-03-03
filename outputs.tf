output "cloudrun_service_endpoints" {
  value = {for k,v in google_cloud_run_service.demo: k => v.status[0].url}
}

output "gcs_buckets" {
    value = values(google_storage_bucket.gcs_demo)[*].name
}