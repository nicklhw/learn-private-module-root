terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  cloud {
    organization = "nw-tfc-learn"

    workspaces {
      name = "sentinel-td-demo-app1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "random" {}

resource "random_pet" "pet_name" {
  length = 2
}

module "s3-webapp" {
  source = "app.terraform.io/nw-tfc-learn/s3-webapp/aws"
  name   = "nwong"
  region = "us-east-1"
  prefix = "dev"
  #  prefix  = join("_", [var.prefix, upper(random_pet.pet_name.id)])
  mal_code = var.aml_malcode
  version  = "1.0.2"
}
