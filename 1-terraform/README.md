# Phase 1 — Terraform

These labs cover Infrastructure as Code using Terraform with DigitalOcean as the cloud provider. By the end of Phase 1 you can provision, manage, and destroy real cloud infrastructure entirely from code.

---

## Environment Setup

### 1. Install Terraform
SSH into your development Droplet and run:
```bash
sudo apt update && sudo apt install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform -version
```

### 2. Set Environment Variables
Run these once per terminal session before any Terraform commands:
```bash
export TF_VAR_do_token="your_digitalocean_api_token"
export AWS_ACCESS_KEY_ID="your_spaces_access_key"
export AWS_SECRET_ACCESS_KEY="your_spaces_secret_key"
```

---

## Labs

| Lab | Topic |
|---|---|
| [01-core-workflow-digitalocean](./01-core-workflow-digitalocean/README.md) | Core Workflow + Remote State + Drift Detection |
| [02-loops-expressions-templatefile](./02-loops-expressions-templatefile/README.md) | Loops, Expressions, and templatefile |
| [03-reusable-modules](./03-reusable-modules/README.md) | Reusable Modules |
| [04-multi-resource-stack-targeted-destroy](./04-multi-resource-stack-targeted-destroy/README.md) | Multi-Resource Stack with Targeted Destroy |