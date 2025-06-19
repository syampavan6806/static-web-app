# Jenkins CI/CD Setup for Dockerized Static Website

This guide explains how to configure Jenkins for building, pushing, and deploying a Docker-based website, with optional email, Slack, or MS Teams notifications.

---

## 📦 Prerequisites

- Jenkins installed and running
- Docker installed on Jenkins node
- Remote Linux server (e.g., EC2) with Docker and SSH access
- GitHub repository for the static website

---

## 🔌 Required Jenkins Plugins

Install the following plugins from **Manage Jenkins → Plugin Manager**:

| Plugin Name              | Purpose                      |
|--------------------------|------------------------------|
| Docker Pipeline          | Docker build/push support    |
| Pipeline                 | Declarative pipeline support |
| Email Extension Plugin   | Email notifications          |
| SSH Agent Plugin         | SSH to remote servers        |
| Credentials Binding      | Secure credential injection  |
| Slack Notification Plugin| Slack integration            |

---

## 🔐 Credentials Setup

Go to **Manage Jenkins → Credentials → (Global)** and add:

### 1. DockerHub Credentials
- **Kind**: Username with password
- **ID**: `dockerhub-creds`

### 2. SSH Key to EC2
- **Kind**: SSH Username with private key
- **Username**: `ec2-user`
- **Private Key**: Paste contents of `.pem`
- **ID**: `your-ssh-key-id`

---

## 📧 Email Notification Setup

Go to **Manage Jenkins → Configure System** under **Extended E-mail Notification**:

- SMTP server: `smtp.gmail.com`
- Port: `587`
- User: `your_email@gmail.com`
- Password: Gmail **App Password**
- TLS: ✅ Enabled

Set a default recipient address and test the configuration.

---

## 💬 Slack Integration (Webhook)

1. Go to your **Slack workspace** → Add **Incoming Webhooks**
2. Generate a webhook URL and select the target channel
3. In Jenkins:
   - **Manage Jenkins → Configure System → Slack**
   - Add:
     - Team Subdomain
     - Integration Token Credential (as `Secret Text`)
     - Channel name (e.g., `#builds`)
4. Use `slackSend` in your `Jenkinsfile`:
```groovy
slackSend(channel: '#builds', message: "Build Successful: ${env.JOB_NAME} #${env.BUILD_NUMBER}")
```
---

## 🚀 Jenkins Pipeline Flow

1. Clone repo from GitHub
2. Build Docker image
3. Push to DockerHub
4. SSH into remote server
5. Pull image, stop old container, run new one
6. Send notifications

---

## 📁 Reference Files

- `Jenkinsfile` – Pipeline definition
- `Dockerfile` – Website container definition
- `README.md` – You’re here :)

---

## 🧑‍💼 Maintainer

**Balaji Reddy Lachhannagri**  
Senior DevOps Architech – Rushi Technologies