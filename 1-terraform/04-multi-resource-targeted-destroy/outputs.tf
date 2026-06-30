output "db_uri" {
    description = "URI of the managed postgres cluster"
    value = digitalocean_database_cluster.db_cluster.uri
}

output "bucket_name" {
    description = "The name of the spaces bucket for static website hosting"
    value = digitalocean_spaces_bucket.web_bucket.name
}

output "droplet_id" {
    description = "The ID of the web droplet"
    value = digitalocean_droplet.web.id
}