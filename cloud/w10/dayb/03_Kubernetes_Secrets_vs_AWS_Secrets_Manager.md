# Kubernetes Secrets vs AWS Secrets Manager

## Mục tiêu

Hiểu vì sao Kubernetes Secret không đủ an toàn cho Production.

---

## Hiểu lầm phổ biến

Nhiều người nghĩ:

```text
Kubernetes Secret
=
Encrypted Secret
```

Điều này không chính xác.

---

## Kubernetes Secret hoạt động thế nào?

Ví dụ:

```yaml
apiVersion: v1
kind: Secret

data:
  password: YWRtaW4=
```

---

## Base64 không phải Encryption

```text
admin
↓
Base64
↓
YWRtaW4=
```

---

### Decode

```bash
echo "YWRtaW4=" | base64 --decode
```

Kết quả:

```text
admin
```

---

## Encoding vs Encryption

### Encoding

Mục đích:

```text
Đổi định dạng dữ liệu
```

Không cần Key.

---

### Encryption

Mục đích:

```text
Bảo mật dữ liệu
```

Sử dụng:

- AES
- RSA
- KMS

---

## Vấn đề của Kubernetes Secret

### etcd

Mặc định:

```text
Secret
↓
etcd
```

lưu dưới dạng plain text nếu không bật Encryption at Rest.

---

### RBAC

Bất kỳ ai có quyền:

```text
get secret
```

có thể đọc Secret.

---

### Ví dụ

```bash
kubectl get secret my-secret -o yaml
```

---

## Rủi ro

Nếu Pod bị compromise:

```text
Pod
 ↓
Read Secret
 ↓
Database Access
 ↓
Privilege Escalation
```

---

## AWS Secrets Manager

Dịch vụ quản lý Secret chuyên dụng.

---

## Workflow

```text
Application
      ↓
ESO
      ↓
AWS Secrets Manager
      ↓
AWS KMS Encryption
```

---

## Lợi ích

### IAM Integration

Kiểm soát:

```text
Pod nào
được đọc Secret nào
```

---

### Versioning

Ví dụ:

```text
AWSCURRENT
AWSPREVIOUS
```

---

### Audit

Mọi hành động đều ghi lại qua:

```text
AWS CloudTrail
```

---

### Rotation

Tự động đổi:

- Password
- API Key
- Token

---

## So sánh

| Tiêu chí | K8s Secret | AWS Secrets Manager |
|-----------|------------|---------------------|
| Encryption | Base64 | KMS |
| Versioning | Không | Có |
| Rotation | Thủ công | Tự động |
| Audit | Hạn chế | CloudTrail |
| IAM | Không | Có |
| Production Ready | Trung bình | Cao |

---

## Kiến trúc khuyến nghị

```text
AWS Secrets Manager
          ↓
External Secrets Operator
          ↓
Kubernetes Secret
          ↓
Pod
```

---

## Kết luận

Production không nên phụ thuộc hoàn toàn vào:

```text
Native Kubernetes Secret
```

Nên sử dụng:

```text
AWS Secrets Manager
+
ESO
```

để có:

- Encryption
- Audit
- Versioning
- Rotation