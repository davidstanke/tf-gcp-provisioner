# Demo of using terraform to provision resources across multiple GCP projects

## Definitions:
`Parent project`: the GCP project from which the terraform process will run

`Child projects`: the GCP projects into which resources will be provisioned

## Requirements:
#### Software:
Terraform 1.x
#### Permissions:
The user running the commands must have write permissions to the terraform state storage bucket (see below), and owner permissions (or a bunch of individual edit permissions which are too many to enumerate) on the child projects.
#### Resources:
Terraform won't create the child projects for you (it could, but that gets messy). So create them beforehand. Also, you'll need a GCS bucket (see below)

## Usage:
1. First off, you'll need to store the Terraform state somewhere. You could use local state, but it's not recommended, so:
    1. Create a GCS storage bucket; call it "$PARENT_PROJECT_ID-tfstate"
2. Initialize Terraform
    1. `terraform init`
    2. At the prompt, enter the name of the GCS bucket that you created for state storage
3. Configure Terraform variables
    1. edit the values in `terraform.tfvars`
        * the child projects go in `gcp_project_ids`
4. Run Terraform
    1. `terraform apply`
    2. When prompted, type `yes` to apply the configuration
        * _tip: add flag `--auto-approve` to skip confirmation_