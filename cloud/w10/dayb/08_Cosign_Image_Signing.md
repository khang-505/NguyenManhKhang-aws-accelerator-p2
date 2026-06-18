# Cosign Image Signing

## Mục tiêu

Đảm bảo Image không bị giả mạo.

---

## Tại sao cần Signing?

Scan sạch chưa đủ.

Hacker có thể:

```text
Replace Image
```

trong Registry.

---

## Cosign

Dự án thuộc:

```text
Sigstore
Linux Foundation
```

---

## Chức năng

### Sign

Ký Image.

### Verify

Xác thực.

### Attestation

Đính kèm:

- SBOM
- Trivy Result

---

## Key-based Signing

### Tạo Key

```bash
cosign generate-key-pair
```

Sinh:

```text
cosign.key
cosign.pub
```

---

## Sign

```bash
cosign sign \
--key cosign.key \
registry/demo:v1
```

---

## Verify

```bash
cosign verify \
--key cosign.pub \
registry/demo:v1
```

---

## Ưu điểm

- Đơn giản
- Offline

---

## Nhược điểm

Quản lý key khó.

---

## Keyless Signing

Dùng:

```text
OIDC
Fulcio
Rekor
```

---

## Luồng

```text
GitHub Actions
      ↓
OIDC
      ↓
Fulcio
      ↓
Ephemeral Key
      ↓
Sign
      ↓
Rekor Log
```

---

## Ưu điểm

Không quản lý Private Key.

---

## Khuyến nghị

Cloud Native:

```text
Keyless
```

Enterprise Offline:

```text
Key-based
```