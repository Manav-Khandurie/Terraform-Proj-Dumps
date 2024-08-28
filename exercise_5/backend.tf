terraform {
  backend "s3" {
    bucket = "terraformstatebucketmanav"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
