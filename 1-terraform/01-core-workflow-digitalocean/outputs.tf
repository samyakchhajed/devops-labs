output "ipv4_address" {
  description = "IPv4 Address of the Droplet"
  value       = digitalocean_droplet.web.ipv4_address
}

output "id" {
  description = "ID of the Droplet"
  value       = digitalocean_droplet.web.id
}

output "name" {
  description = "Name of the Droplet"
  value       = digitalocean_droplet.web.name
}

output "urn" {
  description = "URN of the Droplet"
  value       = digitalocean_droplet.web.urn
}

output "status" {
  description = "Status of the Droplet"
  value       = digitalocean_droplet.web.status
}