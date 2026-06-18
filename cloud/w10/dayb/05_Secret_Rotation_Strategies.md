# Secret Rotation Strategies

## Secret Rotation là gì?

Quá trình thay đổi:

- Password
- API Key
- Access Token

theo chu kỳ hoặc khi có sự cố.

---

## Mục tiêu

### Giảm thời gian khai thác

Nếu Password bị lộ:

```text
Password chỉ sống 30 ngày
```

thay vì:

```text
3 năm
```

---

## Versioning

AWS Secrets Manager không ghi đè.

Ví dụ:

```text
password-v1
      ↓
password-v2
      ↓
password-v3
```

---

## Labels

### AWSCURRENT

Version hiện tại.

### AWSPREVIOUS

Version trước đó.

---

## Luồng Rotation

```text
Secrets Manager
      ↓
Rotate
      ↓
ESO Refresh
      ↓
K8s Secret Update
      ↓
Pod Reload
```

---

## Vấn đề

Pod không tự reload Secret.

Ví dụ:

```text
Environment Variable
```

được nạp lúc start.

---

## Giải pháp

### Rolling Restart

```bash
kubectl rollout restart deployment app
```

---

### Reloader

Tự động restart khi Secret đổi.

---

## Static Rotation

Rotation theo lịch.

Ví dụ:

### 30 ngày

- Production
- Database Admin

### 60 ngày

- Staging

### 90 ngày

- Standard Accounts

---

## Event Driven Rotation

Kích hoạt khi:

```text
Secret Leak
```

---

## Kịch bản

GitHub Secret Scanning

↓

Leak Detected

↓

AWS EventBridge

↓

Lambda

↓

Rotate Immediately

---

## Best Practice

- Rotation ≤ 90 ngày
- Có Versioning
- Có Audit Log
- Có Auto Reload