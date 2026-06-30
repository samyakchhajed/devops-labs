# Lab 2 — Loops, Expressions, and templatefile

Provisions multiple DigitalOcean Droplets using `for_each` from a variable set. Dynamic droplet sizing is determined via a conditional expression based on the deployment environment (dev vs prod). A dynamic startup script is rendered using `templatefile()` to inject each Droplet's unique name into its Nginx configuration.

> Environment setup, Terraform installation, and credential configuration are covered in the [Phase 1 README](../README.md).

---

## Google / AI Sourced Configurations

- **Nginx Server Block Configuration:** The standard Nginx default site configuration template block placed in `setup.sh` (defining the default server, root path, index files, and `try_files` locations) was sourced from Google/external search.

---

## Files

| File | Purpose |
|---|---|
| `main.tf` | Provider setup, resource loop (`for_each`), size conditional, and `templatefile` execution |
| `variables.tf` | Variable declarations for token, region, sizes, name, and environment |
| `backend.tf` | Remote S3-compatible backend block — separated from main.tf for clarity |
| `setup.sh` | Bash template containing Nginx installation commands and the server config template block |

---

## Usage

```bash
# Set credentials for this session
export TF_VAR_do_token="your_token"
export AWS_ACCESS_KEY_ID="your_spaces_access_key"
export AWS_SECRET_ACCESS_KEY="your_spaces_secret_key"

# Initialize, plan, apply
terraform init
terraform plan
terraform apply
```

---

## Verification

1. **State Verification:** Run `terraform state list` and confirm each Droplet appears as a separate resource indexed by its `for_each` key.
2. **Conditional Sizing:** Check each Droplet's size in the DigitalOcean console and confirm they match the expected size for your environment (e.g., `s-1vcpu-1gb` for non-prod, `s-1vcpu-2gb` for prod).
3. **Nginx Configuration Template:** SSH into one of the Droplets and run:
   ```bash
   cat /etc/nginx/sites-available/default
   ```
   Confirm that the `server_name` parameter contains that Droplet's name correctly injected by Terraform.

---

## Cleanup

```bash
terraform destroy
```
