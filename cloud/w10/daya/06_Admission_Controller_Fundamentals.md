# Admission Controller Fundamentals

## Mục tiêu

Hiểu lớp bảo vệ cuối cùng của Kubernetes.

---

## Request Lifecycle

```text
Request
 ↓
Authentication
 ↓
Authorization
 ↓
Admission Controller
 ↓
etcd
```

---

## RBAC vs Admission Controller

### RBAC

Kiểm tra:

```text
Ai?
Được làm gì?
```

---

### Admission Controller

Kiểm tra:

```text
Manifest có hợp lệ không?
```

---

## Hai giai đoạn chính

### Mutating Admission

Có quyền:

```text
Sửa đổi Manifest
```

Ví dụ:

* Inject Sidecar
* Thêm Label
* Thêm Resource Limit

---

### Validating Admission

Có quyền:

```text
Allow
Reject
```

Không sửa dữ liệu.

---

## Ví dụ chặn latest tag

Manifest:

```yaml
image: nginx:latest
```

---

Admission Policy:

```text
Không cho phép latest
```

---

Kết quả:

```text
Forbidden
```

---

## Admission Plugins phổ biến

### NamespaceLifecycle

Chặn tạo Pod trong namespace đang xóa.

---

### LimitRanger

Tự động thêm:

```text
CPU Request
Memory Request
```

---

### ResourceQuota

Kiểm tra:

```text
Pods
CPU
RAM
Storage
```

---

### ServiceAccount

Tự động mount token.

---

## Vai trò

Admission Controller giúp:

* Chuẩn hóa cấu hình
* Bảo mật hệ thống
* Thực thi Policy

trước khi dữ liệu được ghi vào etcd.
