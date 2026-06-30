# Phase 2 — CI/CD and GitHub Actions

These labs cover Continuous Integration and Continuous Deployment (CI/CD) using GitHub Actions.

---

## Environment Setup

### 1. GitHub Repository Setup
Since GitHub Actions run on GitHub servers, you need to push your local code to a remote GitHub repository.
1. Create a new repository on [GitHub](https://github.com).
2. Link your local directory to the remote repository:
   ```bash
   git init
   git remote add origin <your-github-repo-url>
   ```

### 2. Install pre-commit and Gitleaks
On your development machine, run the following to install `pre-commit` and `gitleaks` for scanning secrets:
```bash
# Install pre-commit using pip
pip install pre-commit

# Install Gitleaks (Linux x64 example)
VERSION=$(curl -s https://api.github.com/repos/gitleaks/gitleaks/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/gitleaks/gitleaks/releases/download/${VERSION}/gitleaks_${VERSION:1}_linux_x64.tar.gz
tar -zxvf gitleaks_${VERSION:1}_linux_x64.tar.gz
sudo mv gitleaks /usr/local/bin/
gitleaks version
```

---

## Labs

| Lab | Topic |
|---|---|
| [01-first-github-actions-workflow](./01-first-github-actions-workflow/README.md) | First GitHub Actions Workflow + pre-commit Gitleaks |
| [02-multi-job-docker-build-push](./02-multi-job-docker-build-push/README.md) | Multi-Job Pipeline with Docker Build and Push |
| [03-terraform-pipeline-environment-approval](./03-terraform-pipeline-environment-approval/README.md) | Terraform in GitHub Actions with Environment Approval |
