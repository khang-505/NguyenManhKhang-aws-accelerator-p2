# Defense Chain DevSecOps

## Mục tiêu

Hiểu chuỗi phòng thủ DevSecOps từ Code đến Production.

---

## Defense Chain

```text
Git Repository
      ↓
Scan
      ↓
CI/CD
      ↓
Sign
      ↓
Registry
      ↓
Verify
      ↓
Kubernetes
      ↓
Runtime Security
      ↓
Production
```

---

## 1. Git Repository → Scan

### Mục tiêu

Phát hiện vấn đề sớm nhất.

---

### Kiểm tra

#### SAST

Static Application Security Testing

Phân tích mã nguồn.

---

#### Secret Scanning

Phát hiện:

- API Key
- Password
- Token

---

## 2. CI/CD → Sign

Sau khi build thành công:

```text
Image
```

được ký số.

---

### Mục tiêu

Đảm bảo:

```text
Integrity
Provenance
```

---

## 3. Registry → Verify

Trước khi lưu trữ:

### Scan

Trivy

↓

Phát hiện CVE

---

### Verify Signature

Cosign

↓

Xác thực nguồn gốc.

---

## 4. Kubernetes → Admission

Admission Controller:

- Kyverno
- OPA
- Sigstore Policy Controller

---

## Chính sách

### Allow

Image hợp lệ.

---

### Deny

Image:

- Không ký
- Sai chữ ký
- Không rõ nguồn gốc

---

## 5. Runtime Security

Sau khi Pod chạy.

---

### Theo dõi

- Process
- Network
- File Access

---

### Công cụ

- Falco
- Aqua
- Sysdig

---

## Shift Left Security

Bảo mật được đưa về phía đầu vòng đời.

---

## Truyền thống

```text
Code
 ↓
Deploy
 ↓
Security
```

---

## DevSecOps

```text
Security
 ↓
Code
 ↓
Build
 ↓
Deploy
```

---

## Defense in Depth

```text
Code Scan
      ↓
Image Scan
      ↓
Signing
      ↓
Admission Verify
      ↓
Runtime Security
```

---

## Kết luận

Không có một công cụ nào bảo vệ được toàn bộ.

Cần:

```text
Scan
+
Sign
+
Verify
+
Monitor
```

để bảo vệ Supply Chain.