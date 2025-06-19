# Rushi Technologies Static Website

This is a static website for **Rushi Technologies** that showcases training programs, trainer info, and contact details.

## 📁 Project Structure

- `index.html` – Homepage
- `about.html`, `courses.html`, `contact.html` – Additional pages
- `css/style.css` – Styles
- `images/` – Trainer photo and logo

---

## 🚀 Deployment Instructions (Amazon Linux 2 EC2)

### ✅ Prerequisites

- EC2 instance (Amazon Linux 2)
- Port 80 open in security group
- SSH key and access
- Upload(SCP) Or Clone the Code


## 1. SSH into EC2 and install nginx and deploy website

### Install nginx
```bash
sudo yum update -y
sudo yum install nginx
sudo systemctl enable nginx
sudo systemctl start nginx
```
### Deploy WebContent
```bash
# Remove Existing(Already Deployed) Files 
sudo rm -rf /usr/share/nginx/html/*
# Clone or pull(If already Cloned) Latest Code
git clone https://github.com/Rushi-Technologies/static-web-app.git
sudo cp -r static-web-app/* /usr/share/nginx/html/
```
### start/restart nginx
```bash
sudo systemctl restart nginx
```
### Access Website

Visit:  
```
http://<EC2_PUBLIC_IP>
```

---

## 📜 Notes

- Uses Nginx to serve HTML/CSS content
- Responsive layout supported
- Easily extendable with more pages or contact form

## 🤝 Maintainer

**Balaji Reddy Lachhannagri**  
Senior DevOps Trainer  

---

© 2025 Rushi Technologies
