@echo off
set RCLONE_PATH="C:\Users\hoaip\Downloads\rclone-v1.73.1-windows-amd64\rclone-v1.73.1-windows-amd64\rclone.exe"

echo Dang bat dau backup...
%RCLONE_PATH% copy gdrive:my-ebook gdrive2:my-ebook -P --drive-server-side-across-configs

echo Backup hoan tat!
pause