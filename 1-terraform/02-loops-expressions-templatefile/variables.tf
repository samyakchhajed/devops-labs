variable "instance_sizes" {
  type = set(string)
}

variable "region" {
    type    = string
    default = "blr1"
}

variable "do_token" {
    type = string
    sensitive = true
}

variable "name" {
    type = string
    default = "nginx-webserver"
}

variable "environment" {
    type = string
    default = "staging"
}
