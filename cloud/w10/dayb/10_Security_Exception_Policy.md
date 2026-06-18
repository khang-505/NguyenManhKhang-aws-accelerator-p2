# Security Exception Policy

## Mục tiêu

Quản lý các CVE được phép bỏ qua có kiểm soát.

---

## Tại sao cần Exception?

Không phải mọi CVE đều nguy hiểm.

Ví dụ:

- Không exploitable
- Không có fix
- Package không sử dụng

---

## Trivy Ignore

```text
.trivyignore
```

---

## Ví dụ

```text
CVE-2025-12345

reason:
Not exploitable

owner:
platform-team

expiry:
2026-12-31
```

---

## 4 Nguyên tắc vàng

### 1. CVE ID

Phải chỉ rõ:

```text
CVE-XXXX
```

---

### 2. Owner

Ai chịu trách nhiệm.

Ví dụ:

```text
platform-team
security-team
```

---

### 3. Justification

Giải thích kỹ thuật.

Ví dụ:

```text
Protected by WAF
```

---

### 4. Expiry Date

Bắt buộc có ngày hết hạn.

Ví dụ:

```text
2026-12-31
```

---

## Anti Patterns

### Không làm

```text
Ignore all HIGH
```

---

### Không làm

```text
Ignore all CRITICAL
```

---

## Security Flow Hoàn Chỉnh

```text
Code
 ↓
Trivy Scan
 ↓
Exception Policy
 ↓
Cosign Sign
 ↓
Registry
 ↓
Admission Verify
 ↓
Production
```

---

## Kết luận

Exception Policy không phải:

```text
Tắt bảo mật
```

mà là:

```text
Chấp nhận rủi ro
có kiểm soát
có thời hạn
có người chịu trách nhiệm
```