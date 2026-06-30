terraform{
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
