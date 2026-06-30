output "ipv4_address" {
  description = "IPv4 Address of the Droplet"
  value       = module.web.ipv4_address
}

output "id" {
  description = "ID of the Droplet"
  value       = module.web.id
}

output "name" {
  description = "Name of the Droplet"
  value       = module.web.name
}

output "urn" {
  description = "URN of the Droplet"
  value       = module.web.urn
}

output "status" {
  description = "Status of the Droplet"
  value       = module.web.status
}

output "db_ipv4_address" {
  description = "IPv4 Address of the Droplet"
  value       = module.db.ipv4_address
}

output "db_id" {
  description = "ID of the Droplet"
  value       = module.db.id
}

output "db_name" {
  description = "Name of the Droplet"
  value       = module.db.name
}

output "db_urn" {
  description = "URN of the Droplet"
  value       = module.db.urn
}

output "db_status" {
  description = "Status of the Droplet"
  value       = module.db.status
}