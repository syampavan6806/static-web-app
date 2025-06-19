# GitHub Actions CI/CD Pipeline for Rushi Technologies Website

This guide describes how to configure GitHub Actions to build, push, and deploy a Dockerized static website using DockerHub and remote server via SSH. It also includes **email notifications via Gmail SMTP** on build status.

---

## 📁 Project Structure

- `.github/workflows/ci-cd.yml` – GitHub Actions workflow
- `Dockerfile` – Docker build file for static website
- `index.html`, `about.html`, etc. – Static HTML content
- `README.md` – Setup instructions for Jenkins/GitHub Actions

---

## 🔐 GitHub Secrets Configuration

Go to **GitHub → Repo → Settings → Secrets → Actions → New repository secret** and add:

| Secret Name           | Description                                |
|------------------------|--------------------------------------------|
| `DOCKERHUB_USERNAME`   | DockerHub username                         |
| `DOCKERHUB_PASSWORD`   | DockerHub password or personal access token|
| `REMOTE_HOST`          | Public IP of remote EC2 server             |
| `EC2_SSH_KEY`          | Private SSH key (PEM or raw)               |
| `GMAIL_USER`           | Your Gmail address                         |
| `GMAIL_APP_PASSWORD`   | Gmail app password (not account password)  |
| `EMAIL_TO`             | Comma-separated recipient email addresses  |

---

## 📦 Gmail SMTP Email Notifications

### ✅ Enable App Password in Gmail
1. Go to: https://myaccount.google.com/apppasswords
2. Select App: **Mail**, Device: **Other (GitHub)**
3. Copy the generated 16-character password

Use this for `GMAIL_APP_PASSWORD` GitHub secret.

### ✅ What Gets Sent?
A build summary email will be sent to recipients defined in `EMAIL_TO` with:
- Workflow name
- Build status (success/failure)
- Git branch, commit
- Run link

---

## 🚀 GitHub Actions Workflow Steps

This workflow does the following:

1. Runs on push to `main`
2. Builds a Docker image from project
3. Logs in and pushes to DockerHub
4. SSHs into EC2 and deploys Docker container
5. Sends email via Gmail SMTP (even if failed)

---

## 🧑‍💻 Remote EC2 Setup

```bash
# On Amazon Linux 2
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
```

Then log out and log back in.

---

## 🛠 Optional Integrations

- Slack/Discord/MS Teams (via webhook)
- Use GitHub Environments for prod/stage deploy
- Use GitHub OIDC with AWS for secure deploy

---

## 🧑‍🏫 Maintainer

**Balaji Reddy Lachhannagri**  
Senior DevOps Trainer – Rushi Technologies  
Email: rushitechtraining@gmail.com
