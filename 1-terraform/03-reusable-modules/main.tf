terraform {
  required_version = ">= 1.5.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  
  backend "s3" {
    endpoint                    = "https://blr1.digitaloceanspaces.com"
    region                      = "blr1"
    bucket                      = "terraform-lab1"
    key                         = "terraform.tfstate"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}

provider "digitalocean" {
    token = var.do_token
}

module "web" {
    source    = "./modules/droplet/"
    name      = "web_server"
    region    = var.region
    image     = var.image
    size      = var.size
}

module "db" {
    source      = "./modules/droplet/"
    name        = "db_server"
    region      = var.region
    image       = var.image
    size        = var.size
}
