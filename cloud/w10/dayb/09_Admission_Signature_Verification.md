# Admission Signature Verification

## Mục tiêu

Chỉ cho phép Signed Image chạy trên Kubernetes.

---

## Chính sách

### Allow

Image đã ký hợp lệ.

---

### Deny

- Unsigned Image
- Tampered Image
- Unknown Signer

---

## Luồng hoạt động

```text
kubectl apply
       ↓
API Server
       ↓
Admission Controller
       ↓
Verify Signature
       ↓
Allow / Deny
```

---

## Các giải pháp

### Kyverno

Khuyến nghị.

### Sigstore Policy Controller

Chính chủ Sigstore.

### Gatekeeper

Tùy biến nâng cao.

---

## Kyverno Verify Image

```yaml
verifyImages:
- imageReferences:
  - registry.company.com/*
```

---

## Validation Action

```yaml
validationFailureAction:
  Enforce
```

---

## Kết quả

### Signed

```text
Pod Created
```

### Unsigned

```text
403 Forbidden
```

---

## Best Practice

Production:

```text
Enforce
```

không dùng:

```text
Audit Only
```