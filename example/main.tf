variable "region" {
  default = "us-east-1"
}
provider "aws" {
  region = var.region
  version = "~> 3.0"
  #profile = "mfa"
  #shared_credentials_file = "~/.aws/credentials"
}

terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "my-state-bucket"
    acl    = "private"
    #profile = "mfa"
    #shared_credentials_file = "~/.aws/credentials"
  }
}

module "static_website" {
  source = "../"
  bucket_name = "my-website.com"
  folder_path = "src/"
  tags = {
    Name="my-static-website"
  }
}

output "domain" {
  value = module.static_website.domain
}
