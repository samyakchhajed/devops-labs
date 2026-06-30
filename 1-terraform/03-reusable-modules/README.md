# Lab 3 — Reusable Modules

Refactors the flat Droplet provisioning code from Lab 1 into a reusable Terraform module inside `modules/droplet/`. The module is parameterized to accept input variables for the droplet's name, size, and region. It is instantiated twice from the root `main.tf` to provision a web server and a database server.

> Environment setup, Terraform installation, and credential configuration are covered in the [Phase 1 README](../README.md).

---

## Files

| File | Purpose |
|---|---|
| `main.tf` | Root configuration — declares provider, backend, and calls the droplet module twice (`web` and `db`) |
| `variables.tf` | Root input variable declarations |
| `outputs.tf` | Root outputs — reads and displays values from both `module.web` and `module.db` |
| `setup.sh` | Startup script — installs and starts Nginx via user_data |
| `modules/droplet/resource.tf` | Module configuration — defines the `digitalocean_droplet` resource |
| `modules/droplet/variables.tf` | Module input variable declarations (`name`, `image`, `region`, `size`) |
| `modules/droplet/outputs.tf` | Module outputs (IP, ID, name, URN, status) exposed to the root |

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

**State Verification:** Run `terraform state list` and confirm both Droplets appear as separate resources managed by the same module:
```bash
module.web.digitalocean_droplet.web
module.db.digitalocean_droplet.web
```
Both resources show `.web` in the state path because they use the same module definition. The distinction is in the module instance name — `module.web` vs `module.db`.

---

## Cleanup

```bash
terraform destroy
```
