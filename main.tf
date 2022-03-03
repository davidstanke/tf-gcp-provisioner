terraform {
  backend "gcs" {
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      version = "~> 4.12.0"
    }
  }
}