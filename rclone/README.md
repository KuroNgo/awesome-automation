# 🚀 RClone Cheat Sheet for Developers

> **Note:** Always append a colon `:` after the remote name (e.g., `gdrive:`, `backup:`)

## 🔗 Quick Links

* **Official Website:** [rclone.org](https://rclone.org/)
* **Downloads:** [rclone.org/downloads](https://rclone.org/downloads/)
* **Documentation:** [rclone.org/docs](https://rclone.org/docs/)
* **Google Drive Specifics:** [rclone.org/drive](https://rclone.org/drive/)
* **Required for Mount (Windows):** [WinFsp Downloads](https://winfsp.dev/rel/)

---

## 1. Configuration Management

* `rclone config`: Open the interactive setup (Add/Edit/Delete remotes).
* `rclone listremotes`: List all configured cloud storage services.
* `rclone config show`: View detailed configuration (Tokens, Client IDs, etc.).

---

## 2. File Browsing (Verification)

* `rclone lsd gdrive:`: List **directories** at the root level.
* `rclone ls gdrive:FolderName`: List **all files** recursively (includes file size).
* `rclone lsl gdrive:FolderName`: List files with **modification timestamps**.
* `rclone size gdrive:FolderName`: Calculate the **total size** of the directory.

---

## 3. Copy & Sync (Production)

| Command | Purpose | Important Note |
| --- | --- | --- |
| **`copy`** | Copy new/changed files | Does **not** delete files from the destination. |
| **`sync`** | Make destination identical to source | **Warning:** Deletes files from destination if they don't exist in source. |
| **`move`** | Move files | Deletes files from source after successful copy. |

**Standard Command Structure:**
`rclone copy <source> <destination> -P --drive-server-side-across-configs`

---

## 4. Lifesaving Flags

* `-P` (or `--progress`): View real-time transfer speed and ETA.
* `--dry-run`: Simulation mode (check what will happen without actually copying/deleting).
* `--exclude "vendor/**"`: Ignore the `vendor` folder (critical for Go projects).
* `--exclude-from "exclude-file.txt"`: Use a dedicated file for exclusion lists.
* `--ignore-existing`: Skip files that are already present at the destination.

---

## 5. Automation for Windows

* **Mount as Virtual Drive:**
`rclone mount gdrive: G: --vfs-cache-mode full`
* **Makefile Integration (Recommended):**
```makefile
backup-code:
    rclone sync . gdrive:Backups/AgriMarket --exclude ".git/**" --exclude "vendor/**" -P

```



---

## 6. Quick Troubleshooting

* **Error 404/Forbidden:** Verify if the folder is **Shared** between the two Drives on the web interface.
* **Remote Not Found:** Check if you missed the trailing colon `:`.
* **Token Expired:** Run `rclone config`, select `Edit` for that remote, and re-run the `Authenticate` (login) step.
