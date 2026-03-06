# 🚀 RClone Cheat Sheet cho Lập trình viên

> **"Nhanh. Bảo mật. Đa năng."** — Công cụ dòng lệnh tối thượng để quản lý hơn 70 nhà cung cấp lưu trữ đám mây.

**Lưu ý:** Luôn phải thêm dấu hai chấm `:` sau tên remote (Ví dụ: `remote:`, `backup:`)

---

## 🔗 Liên kết nhanh

* **Trang chủ:** [rclone.org](https://rclone.org/)
* **Các nhà cung cấp hỗ trợ (70+):** [rclone.org/overview](https://rclone.org/overview/)
* **Tài liệu hướng dẫn lệnh:** [rclone.org/docs](https://rclone.org/docs/)
* **Yêu cầu để Mount (Windows):** [WinFsp Downloads](https://winfsp.dev/rel/)

---

## 💡 Tại sao nên dùng RClone?

* ⚡ **Nhanh:** Hỗ trợ truyền tải đa luồng (`--transfers`) và **Server-Side Copy**, cho phép chuyển dữ liệu giữa các đám mây mà không tiêu tốn băng thông máy cá nhân.
* 🔒 **Bảo mật:** Tích hợp công nghệ **RClone Crypt**, giúp mã hóa đầu cuối (end-to-end) cho cả file và tên file trước khi dữ liệu rời khỏi máy bạn.
* 🌍 **Đa năng:** Một bộ lệnh duy nhất cho hơn 70 dịch vụ: Google Drive, OneDrive, Amazon S3, Dropbox, FTP, SFTP, và nhiều hơn thế.

---

## 1. Quản lý cấu hình

* `rclone config`: Mở trình thiết lập tương tác (Thêm/Sửa/Xóa remote).
* `rclone listremotes`: Liệt kê tất cả các dịch vụ đám mây đã cấu hình.
* `rclone config show`: Xem chi tiết cấu hình (Token, Client ID, v.v.).
* `rclone config disconnect remote:`: Đăng xuất an toàn khỏi một phiên làm việc đám mây cụ thể.

---

## 2. Duyệt File (Kiểm tra dữ liệu)

* `rclone lsd remote:`: Liệt kê các **thư mục** ở tầng gốc (root).
* `rclone ls remote:path`: Liệt kê **tất cả file** đệ quy (bao gồm cả dung lượng).
* `rclone lsl remote:path`: Liệt kê file kèm theo **dấu mốc thời gian sửa đổi**.
* `rclone size remote:path`: Tính **tổng dung lượng** của thư mục đó.

---

## 3. Sao chép & Đồng bộ (Thực thi đa nền tảng)

| Lệnh | Mục đích | Lưu ý quan trọng |
| --- | --- | --- |
| **`copy`** | Sao chép file mới hoặc file có thay đổi | **Không** xóa file ở đích nếu nguồn không có. |
| **`sync`** | Đồng bộ hóa toàn diện | **Cảnh báo:** Sẽ xóa file ở đích nếu nguồn không có. |
| **`move`** | Di chuyển file | Xóa file ở nguồn sau khi đã sao chép xong sang đích. |

**Cấu trúc lệnh tiêu chuẩn:**
`rclone copy source_remote:path destination_remote:path -P`

---

## 4. Các tham số (Flags) "Cứu cánh"

* `-P` (hoặc `--progress`): Xem tốc độ truyền tải, phần trăm và thời gian dự kiến (ETA) theo thời gian thực.
* `--dry-run`: Chế độ chạy thử; kiểm tra xem lệnh sẽ làm gì mà không thực sự thay đổi dữ liệu.
* `--exclude "node_modules/**"`: Loại bỏ các thư mục nặng không cần thiết (hỗ trợ cả `.git`, `vendor`, v.v.).
* `--ignore-existing`: Bỏ qua các file đã tồn tại ở đích.
* `--drive-server-side-across-configs`: (Chỉ dành cho GDrive) Chuyển file trực tiếp trên server của Google.

---

## 5. Tự động hóa & Gắn ổ đĩa (Mount)

* **Gắn Cloud thành ổ đĩa ảo:**
`rclone mount remote:path G: --vfs-cache-mode full`
*(Truy cập file trên Cloud trực tiếp từ Windows File Explorer)*
* **Tích hợp vào Makefile (Ví dụ):**

```makefile
backup:
    rclone sync ./src backup_cloud:projects/my-app --exclude-from .rcloneignore -P

```

---

## 6. Xử lý lỗi nhanh (Troubleshooting)

* **Lỗi 404/Forbidden:** Kiểm tra xem thư mục đã được **Chia sẻ (Shared)** giữa các tài khoản trên giao diện web chưa.
* **Remote Not Found:** Kiểm tra xem bạn có quên dấu hai chấm `:` hoặc gõ sai tên remote không.
* **Token hết hạn:** Chạy `rclone config`, chọn `Edit` cho remote đó và chọn `y` để xác thực lại (login).
* **Tốc độ chậm:** Tăng số lượng luồng truyền tải song song bằng cách dùng `--transfers 8` hoặc cao hơn.

---

## ⚖️ Giấy phép

Hướng dẫn này được phát hành dưới giấy phép **MIT License**.