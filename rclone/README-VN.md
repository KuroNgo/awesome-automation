# 🚀 RClone Cheat Sheet cho Developer

> **Lưu ý:** Luôn phải thêm dấu hai chấm `:` sau tên remote (Ví dụ: `gdrive:`, `backup:`)

## 🔗 Liên kết nhanh

* **Trang chủ:** [rclone.org](https://rclone.org/)
* **Tải về:** [rclone.org/downloads](https://rclone.org/downloads/)
* **Tài liệu chi tiết:** [rclone.org/docs](https://rclone.org/docs/)
* **Hướng dẫn cho Google Drive:** [rclone.org/drive](https://rclone.org/drive/)
* **Yêu cầu để Mount (Windows):** [WinFsp Downloads](https://winfsp.dev/rel/)

---

## 1. Quản lý cấu hình

* `rclone config`: Mở trình thiết lập tương tác (Thêm/Sửa/Xóa remote).
* `rclone listremotes`: Liệt kê tất cả các dịch vụ đám mây đã cấu hình.
* `rclone config show`: Xem chi tiết cấu hình (Tokens, Client IDs, v.v.).

---

## 2. Duyệt File (Kiểm tra dữ liệu)

* `rclone lsd gdrive:`: Liệt kê các **thư mục** ở tầng gốc (root).
* `rclone ls gdrive:TenThuMuc`: Liệt kê **tất cả file** (bao gồm cả dung lượng).
* `rclone lsl gdrive:TenThuMuc`: Liệt kê file kèm theo **thời gian sửa đổi**.
* `rclone size gdrive:TenThuMuc`: Tính **tổng dung lượng** của thư mục đó.

---

## 3. Sao chép & Đồng bộ (Thực thi)

| Lệnh | Mục đích | Lưu ý quan trọng |
| --- | --- | --- |
| **`copy`** | Sao chép file mới/thay đổi | **Không** xóa các file đang có ở đích. |
| **`sync`** | Làm cho đích giống hệt nguồn | **Cảnh báo:** Sẽ xóa file ở đích nếu nguồn không có. |
| **`move`** | Di chuyển file | Xóa file ở nguồn sau khi sao chép thành công. |

**Cấu trúc lệnh tiêu chuẩn:**
`rclone copy <nguồn> <đích> -P --drive-server-side-across-configs`

---

## 4. Các tham số (Flags) "Cứu cánh"

* `-P` (hoặc `--progress`): Xem tốc độ truyền tải và thời gian dự kiến theo thời gian thực.
* `--dry-run`: Chế độ chạy thử (kiểm tra xem lệnh sẽ làm gì mà không thực sự ghi/xóa).
* `--exclude "vendor/**"`: Loại bỏ thư mục `vendor` (quan trọng cho dự án Go).
* `--exclude-from "exclude-file.txt"`: Sử dụng một file riêng để liệt kê danh sách loại trừ.
* `--ignore-existing`: Bỏ qua các file đã tồn tại ở đích (tránh ghi đè).

---

## 5. Tự động hóa trên Windows

* **Gắn ổ đĩa ảo (Mount):**
`rclone mount gdrive: G: --vfs-cache-mode full`
* **Tích hợp vào Makefile (Khuyên dùng):**

```makefile
backup-code:
    rclone sync . gdrive:Backups/AgriMarket --exclude ".git/**" --exclude "vendor/**" -P

```

---

## 6. Xử lý lỗi nhanh

* **Lỗi 404/Forbidden:** Kiểm tra xem thư mục đã được **Chia sẻ (Shared)** giữa hai Drive trên giao diện web chưa.
* **Remote Not Found:** Kiểm tra xem bạn có quên dấu hai chấm `:` ở cuối tên remote không.
* **Token hết hạn:** Chạy `rclone config`, chọn `Edit` cho remote đó và thực hiện lại bước đăng nhập (Authenticate).
