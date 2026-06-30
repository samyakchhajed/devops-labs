terraform {
  required_version = ">= 1.5.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
    token = var.do_token
}

resource "digitalocean_droplet" "loops" {
  for_each  = var.instance_sizes
  name      = "${var.name}-${each.value}"
  image     = "ubuntu-22-04-x64"
  size      = var.environment == "prod" ? "s-1vcpu-2gb" : "s-1vcpu-1gb" 
  tags      = ["terraform_lab1"]
  region    = var.region
  user_data = templatefile("setup.sh", {
    env = var.environment
    droplet_name = "${var.name}-${each.value}"
    })
}