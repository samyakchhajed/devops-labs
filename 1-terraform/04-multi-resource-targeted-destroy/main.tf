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

resource "digitalocean_droplet" "web" {
    name      = var.name
    region    = var.region
    image     = var.image
    size      = var.size
    user_data = templatefile("setup.sh", {
      db_uri = digitalocean_database_cluster.db_cluster.uri
    })
    tags      = ["terraform_lab4"]
    depends_on = [
        digitalocean_database_cluster.db_cluster,
        digitalocean_spaces_bucket.web_bucket
    ]
}

resource "digitalocean_spaces_bucket" "web_bucket" {
    name   = "${var.name}-bucket"
    region = var.region
}

resource "digitalocean_database_cluster" "db_cluster" {
    name       = "${var.name}-db"
    engine     = "pg"
    version    = "15"
    size       = "db-s-1vcpu-1gb"
    region     = var.region
    node_count = 1
    tags       = ["terraform_lab4"]
}


