# Lab 1 — First GitHub Actions Workflow

Creates a simple Python Flask application and implements a basic GitHub Actions workflow that runs unit tests on every push. Deliberately introduces a failing test to verify that the CI pipeline catches the error. Installs and configures Gitleaks as a pre-commit hook to prevent sensitive secrets from being committed locally.

*Note: The Flask application and unit tests (app.py and test_app.py) were scaffolded by AI.*

> Environment setup, pre-commit installation, and repository setup are covered in the [Phase 2 README](../README.md).

---

## Files

| File | Purpose |
|---|---|
| `app.py` | Python Flask application exposing a basic API endpoint |
| `requirements.txt` | Python dependencies required (`flask`, `pytest`) |
| `test_app.py` | Pytest suite containing unit tests for the Flask application |
| `.github/workflows/ci.yml` | GitHub Actions workflow configuration for the CI pipeline |
| `.pre-commit-config.yaml` | Pre-commit configuration mapping the Gitleaks hook |

---

## Usage

```bash
# Install dependencies locally for development
pip install -r requirements.txt

# Run tests locally
pytest

# Set up pre-commit hooks
pre-commit install
```

---

## Verification

**Pipeline Execution:** Push a clean commit to your GitHub repository and check the **Actions** tab on GitHub to verify that the workflow succeeds.

**Secrets Blocking (Gitleaks):** 
1. Create a dummy secret in a file (e.g., `temp.txt` containing `API_KEY="xoxb-1234567890"`).
2. Attempt to run `git add temp.txt` and `git commit -m "add test secret"`.
3. Confirm that `pre-commit` runs Gitleaks and blocks the commit from succeeding.

---

## Deliberate Failure

1. Modify `app.py` or `test_app.py` so that a unit test fails (e.g., change the expected string in `test_app.py`).
2. Commit and push the change to your repository.
3. Check the **Actions** tab on GitHub and confirm that the workflow fails at the test runner step.

---

## Cleanup

Revert the failing test change, remove any temporary credentials files, and push again to restore the green checkmark badge:
```bash
# Revert the last commit if it was a breaking test
git revert HEAD
git push origin main
```
