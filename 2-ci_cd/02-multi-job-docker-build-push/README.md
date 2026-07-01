# Lab 2 — Multi-Job Pipeline with Docker Build and Push

Implements a multi-job GitHub Actions workflow containing two dependent jobs: `test` and `deploy`. The `deploy` job runs only if the `test` job passes. It containerizes the Flask application, tags the Docker image with the Git commit SHA, and pushes it to GitHub Container Registry (GHCR) using repository-scoped GitHub Secrets.

*Note: The Flask application and unit tests (app.py and test_app.py) were scaffolded by AI.*

> Environment setup, pre-commit installation, and repository setup are covered in the [Phase 2 README](../README.md).

---

## Files

| File | Purpose |
|---|---|
| `app.py` | Flask application code |
| `requirements.txt` | Python dependencies |
| `test_app.py` | Pytest suite containing unit tests |
| `Dockerfile` | Multi-stage build definition to containerize the Flask application |
| `.github/workflows/CI-lab-2.2.yml` | Workflow defining dependent `test` and `deploy` jobs |

---

## Usage

Commit and push code to the remote repository to trigger the multi-job workflow:

```bash
# Add all workspace files
git add .

# Commit changes
git commit -m "Configure multi-job docker pipeline"

# Push to the remote branch to trigger GitHub Actions
git push origin main
```

---

## Verification

**Job Skipping:** Push a commit containing a failing test. Go to the GitHub **Actions** tab and verify that the `test` job fails, and the `deploy` job is skipped entirely.

**Package Registry:** Push a passing commit. Go to the GitHub profile or repository page, select **Packages**, and verify that the Docker image has been uploaded and tagged with the correct Git commit SHA.

---

## Cleanup

To free up storage space in the registry:
1. Go to **Packages** on GitHub.
2. Select the Flask app image.
3. Under **Package settings**, delete the package or individual tags.

---

## Proof of Success

### 1. GitHub Actions Workflow
* **Dependent Jobs Execution:** Verified in the **Actions** tab that the `test` and `deploy` jobs execute in sequence. The `deploy` job runs successfully only after the `test` job passes.
* **Conditional skipping:** Verified that introducing a failing test results in a failed `test` job and a completely skipped `deploy` job.

### 2. GitHub Container Registry (GHCR) Pushed Image
* **Authentication & Upload:** The login step successfully authenticates using `docker/login-action` and the temporary `GITHUB_TOKEN` credentials.
* **Registry Verification:** The package is created under GitHub Packages and tagged with the Git commit SHA representing the exact build commit.
