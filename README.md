# devops-labs

Hands-on labs built as structured skill-building before the main devops-projects repo. Each lab is a standalone exercise targeting a specific concept. Every lab is pushed only when fully complete — files, README, architecture diagram, and deployment proof.

All labs run remotely. Nothing runs on a local machine.

---

## Common Environment Setup

### 1. Create a Development Droplet
Spin up a separate DigitalOcean Droplet to use as your development environment. This is where you install tools and run all commands. It is not the infrastructure being provisioned — it is the machine you work from.

### 2. Set Environment Variables
Each has additional environment-specific setup. The following are required across all phases:
```bash
export TF_VAR_do_token="your_digitalocean_api_token"
export AWS_ACCESS_KEY_ID="your_spaces_access_key"
export AWS_SECRET_ACCESS_KEY="your_spaces_secret_key"
```

---

## Phases

| Phase | Topic |
|---|---|
| [1-Terraform](./1-terraform/README.md) | Infrastructure as Code |
| [2-CI/CD](./2-ci_cd/README.md) | GitHub Actions Pipelines |
| [3-Observability](./3-observability/README.md) | Prometheus and Grafana |
| [4-Kubernetes](./4-kubernetes/README.md) | Container Orchestration |
| [5-Azure](./5-azure/README.md) | Azure Services |
| [6-Multicloud](./6-multicloud/README.md) | AWS and Azure |