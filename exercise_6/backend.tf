terraform {
  # Configures S3 as the backend for storing Terraform state files
  backend "s3" {
    # Name of the S3 bucket where state will be stored
    bucket = "terraformstatebucketmanav"
    # Path within the bucket where state file will be written
    key    = "terraform/terraform.tfstate"
    # AWS region where the S3 bucket resides
    region = "us-east-1"
  }
}