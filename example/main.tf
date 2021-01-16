variable "region" {
  default = "ap-southeast-1"
}
provider "aws" {
  region = var.region
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    region = "ap-southeast-1"
    bucket = "zidan-terraform-state"
    acl    = "private"
  }
}
module "static_website" {
  source = "../"
  bucket_name = "zidan-static-website"
  folder_path = "./src"
  tags = {
    Name="my-static-website"
  }
}
