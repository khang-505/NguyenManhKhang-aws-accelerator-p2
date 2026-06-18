# External Secrets Operator (ESO)

## Mục tiêu

Tự động đồng bộ Secret từ hệ thống quản lý bí mật bên ngoài vào Kubernetes.

---

## ESO là gì?

External Secrets Operator (ESO) là một Kubernetes Operator giúp kết nối:

- AWS Secrets Manager
- HashiCorp Vault
- Google Secret Manager
- Azure Key Vault

với Kubernetes.

---

## Kiến trúc 3 tầng

```text
AWS Secrets Manager
        │
        ▼
ExternalSecret
        │
        ▼
Kubernetes Secret
        │
        ▼
Application Pod
```

---

## Lợi ích

### Không lưu Secret trong Git

GitOps Repository chỉ chứa:

```yaml
kind: ExternalSecret
```

không chứa:

```yaml
kind: Secret
```

---

### Đồng bộ tự động

Nếu Secret trên AWS thay đổi:

```text
AWS Secret
    ↓
ESO Sync
    ↓
Kubernetes Secret Update
```

---

## Cài đặt bằng Helm

### Add Repository

```bash
helm repo add external-secrets \
https://charts.external-secrets.io
```

### Update

```bash
helm repo update
```

### Install

```bash
helm install external-secrets \
external-secrets/external-secrets \
-n external-secrets \
--create-namespace
```

---

## Thành phần được cài

### Core Controller

Theo dõi:

```text
ExternalSecret
SecretStore
```

---

### Webhook

Validation CRDs.

---

### Cert Controller

Quản lý TLS Certificate.

---

## SecretStore

Định nghĩa:

```text
Kết nối tới đâu?
Xác thực thế nào?
```

Ví dụ AWS:

```yaml
kind: SecretStore

provider:
  aws:
    service: SecretsManager
    region: ap-southeast-1
```

---

## Authentication

Khuyến nghị:

```text
IRSA
IAM Role
```

không dùng:

```text
Access Key
Secret Key
```

---

## Best Practice

- Một SecretStore cho mỗi môi trường
- Dùng IAM Role
- Không hardcode credentials