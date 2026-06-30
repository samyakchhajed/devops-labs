# Lab 4 — Multi-Resource Stack with Targeted Destroy

Provisions three DigitalOcean resources together in a single Terraform config: a Droplet, a managed PostgreSQL database cluster, and a Spaces storage bucket. The database connection URI is passed into the Droplet's startup script via `templatefile()`. `depends_on` ensures the database and bucket are fully provisioned before the Droplet is created. After applying, a targeted destroy removes only the Droplet while leaving the database and bucket intact.

> Environment setup, Terraform installation, and credential configuration are covered in the [Phase 1 README](../README.md).

---

## Files

| File | Purpose |
|---|---|
| `main.tf` | Provider, backend, and all three resource definitions — Droplet, database cluster, and Spaces bucket |
| `variables.tf` | Input variable declarations |
| `outputs.tf` | Outputs for the database URI, bucket name, and Droplet ID |
| `setup.sh` | Startup script template — receives `db_uri` from Terraform and embeds it into the Droplet on boot |

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

**State Verification:** Run `terraform state list` and confirm all three resources appear:
```bash
digitalocean_database_cluster.db_cluster
digitalocean_droplet.web
digitalocean_spaces_bucket.web_bucket
```

**Output Verification:** Run `terraform output db_uri` and confirm the PostgreSQL connection string is printed.

---

## Targeted Destroy

To delete only the Droplet while leaving the database and bucket intact:
```bash
terraform destroy -target=digitalocean_droplet.web
```

Re-run `terraform state list` and confirm only `digitalocean_droplet.web` has been removed.

---

## Cleanup

```bash
terraform destroy
```
