terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "web_app_1" {
  region = "eu-north-1"
  source = "../web-app-module"
  # Input Variables
  app_name         = "web-app-1"
  instance_type    = "t3.micro"
  environment_name = "development"
}

module "web_app_2" {
  region = "eu-north-1"
  source           = "../web-app-module"
  environment_name = "production"
  # Input Variables
  app_name      = "web-app-2"
  instance_type = "t3.micro"
}
