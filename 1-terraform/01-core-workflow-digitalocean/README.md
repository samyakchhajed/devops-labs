# Lab 1 — Core Workflow + Remote State + Drift Detection

Provisions a single DigitalOcean Droplet running Nginx using Terraform. State is stored remotely in DigitalOcean Spaces. Demonstrates drift detection by manually changing infrastructure and observing Terraform flag the mismatch.

> Environment setup, Terraform installation, and credential configuration are covered in the [Phase 1 README](../README.md).

---

## Files

| File | Purpose |
|---|---|
| `main.tf` | Terraform block, provider, backend, and Droplet resource |
| `variables.tf` | Input variable declarations |
| `outputs.tf` | Output values printed after apply |
| `setup.sh` | Startup script — installs and starts Nginx via user_data |

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

**Nginx:** Visit `http://<ipv4_address>` and confirm the Nginx welcome page loads.

**Remote State:** Run `ls -la` in the lab directory and confirm no local `terraform.tfstate` file exists.

---

## Drift Detection

1. Log in to the DigitalOcean console.
2. Find the Droplet and manually remove the tag `terraform_lab1`.
3. Run `terraform plan` and observe it flagging the tag mismatch.

---

## Cleanup

```bash
terraform destroy
```