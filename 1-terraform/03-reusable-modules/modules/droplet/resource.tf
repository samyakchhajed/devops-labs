resource "digitalocean_droplet" "web" {
    name      = var.name
    region    = var.region
    image     = var.image
    size      = var.size
    user_data = file("setup.sh")
    tags      = ["terraform_lab1"]
}