# 🛠️ My Professional Ops & Toolset

### "The best tools are the ones that disappear into your workflow."

This repository is a dedicated **Personal Toolbox**. It does **not** contain project source code. Instead, it serves as a central hub for my DevOps scripts, automation flows, and technical documentation to ensure a seamless work environment across any machine.

---

## 🚀 What's Inside?

### ☁️ Cloud Operations (RClone)

* **Storage Sync:** Production-ready RClone configurations for cross-cloud data migration.
* **Automated Backup Logic:** Scripts to safeguard external project directories (e.g., *AgriMarket*, *Go-Templates*) to encrypted cloud remotes.
* **Mounting Utilities:** One-click scripts to map Google Drive/OneDrive as local virtual drives.


### 📜 Technical Knowledge Base

* **Cheat Sheets:** Quick-reference guides for RClone, Git, and Backend Architecture.
* **Environment Setup:** Step-by-step instructions to replicate my development environment on Windows/Linux.

### 🤖 System Automation

* **Startup Scripts:** Batch and PowerShell scripts to automate routine tasks upon Windows logon.
* **Maintenance Tools:** Utility scripts for log cleaning, directory tree exports, and system health checks.

---


## 📂 Repository Map

```text
.

├── rclone/             # Cloud sync configs & English/Vietnamese guides

├── automation/         # Windows .bat and .ps1 startup scripts

├── docs/               # Architecture notes & CLI cheat sheets

├── backups/            # Logic & lists for external project backups

└── README.md          

```

---


## 🛠️ Usage

### Syncing this Toolbox

To update this toolset across your devices:

```bash

# Pull the latest tools
git pull origin main

# Sync tools to your private cloud
rclone sync . gdrive:work-tools -P --exclude ".git/**"

```

---

## 🔒 Security Policy

* **Zero Credentials:** No `.env`, `rclone.conf`, or private keys are stored here.
* **Pure Logic:** This repo contains only scripts and documentation. All actual data resides in secure, private cloud storage.






