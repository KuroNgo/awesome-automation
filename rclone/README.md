# 🚀 RClone Cheat Sheet for Developers

> **"Fast. Secure. Universal."** — The ultimate command-line tool for managing 70+ cloud storage providers.

**Note:** Always append a colon `:` after the remote name (e.g., `remote:`, `backup:`)

---

## 🔗 Quick Links

* **Official Website:** [rclone.org](https://rclone.org/)
* **Supported Providers (70+):** [rclone.org/overview](https://rclone.org/overview/)
* **Command Documentation:** [rclone.org/docs](https://rclone.org/docs/)
* **Required for Mount (Windows):** [WinFsp Downloads](https://winfsp.dev/rel/)

---

## 💡 Why RClone?

* ⚡ **Fast:** Supports multi-threaded transfers (`--transfers`) and **Server-Side Copy**, allowing data migration between clouds without using your local bandwidth.
* 🔒 **Secure:** Features built-in **RClone Crypt** technology, enabling end-to-end encryption for files and filenames before they ever leave your machine.
* 🌍 **Universal:** A single unified set of commands for over 70 providers: Google Drive, OneDrive, Amazon S3, Dropbox, FTP, SFTP, and more.

---

## 1. Configuration Management

* `rclone config`: Launch the interactive setup (Add/Edit/Delete remotes).
* `rclone listremotes`: List all configured cloud storage services.
* `rclone config show`: View detailed configuration (Tokens, Client IDs, etc.).
* `rclone config disconnect remote:`: Safely log out from a specific cloud session.

---

## 2. File Browsing (Verification)

* `rclone lsd remote:`: List **directories** at the root level.
* `rclone ls remote:path`: List **all files** recursively (includes file size).
* `rclone lsl remote:path`: List files with **modification timestamps**.
* `rclone size remote:path`: Calculate the **total size** of the directory.

---

## 3. Copy & Sync (Multi-Cloud Operations)

| Command | Purpose | Important Note |
| --- | --- | --- |
| **`copy`** | Copy new/changed files | Does **not** delete files from the destination. |
| **`sync`** | Full synchronization | **Warning:** Deletes files from destination if they don't exist in source. |
| **`move`** | Move files | Deletes files from source after successful copy. |

**Standard Transfer Structure:**
`rclone copy source_remote:path destination_remote:path -P`

---

## 4. Lifesaving Flags

* `-P` (or `--progress`): View real-time transfer speed, percentage, and ETA.
* `--dry-run`: Simulation mode; check what will happen without actually modifying data.
* `--exclude "node_modules/**"`: Ignore heavy dependency folders (supports `.git`, `vendor`, etc.).
* `--ignore-existing`: Skip files that are already present at the destination.
* `--drive-server-side-across-configs`: (GDrive only) Transfers files directly on Google's servers.

---

## 5. Automation & Mounting

* **Mount Cloud as a Virtual Drive:**
`rclone mount remote:path G: --vfs-cache-mode full`
*(Access your Cloud files directly in Windows File Explorer)*
* **Makefile Integration (Example):**

```makefile
backup:
    rclone sync ./src backup_cloud:projects/my-app --exclude-from .rcloneignore -P

```

---

## 6. Quick Troubleshooting

* **Error 404/Forbidden:** Verify if the folder is **Shared** between the accounts on the web interface.
* **Remote Not Found:** Check if you missed the trailing colon `:` or misspelled the remote name.
* **Token Expired:** Run `rclone config`, select `Edit` for that remote, and choose `y` to re-authenticate (login).
* **Slow Speed:** Increase the number of parallel transfers using `--transfers 8` or higher.

---

## ⚖️ License

This guide is licensed under the **MIT License**.