# Trivy Image Scanning

## Trivy là gì?

Trivy là công cụ Security Scanner mã nguồn mở của Aqua Security.

---

## Các đối tượng quét

### Container Image

```bash
trivy image nginx:latest
```

---

### Filesystem

```bash
trivy fs .
```

---

### Kubernetes

```bash
trivy k8s cluster
```

---

### Terraform

```bash
trivy config .
```

---

## Những gì Trivy phát hiện

### CVE

Common Vulnerabilities and Exposures

---

### Secret

API Key

Password

Token

---

### Misconfiguration

Ví dụ:

```text
Container chạy root
```

---

### SBOM

Software Bill of Materials

---

## Ví dụ Scan

```bash
trivy image nginx:latest
```

---

## Kết quả

```text
CRITICAL: 2
HIGH: 15
MEDIUM: 40
```

---

## Ý nghĩa

### CRITICAL

Remote Code Execution

Chiếm quyền hệ thống.

---

### HIGH

Rò rỉ dữ liệu

Privilege Escalation

---

### MEDIUM

DoS

Thông tin hạn chế.

---

### LOW

Rủi ro thấp.

---

## Best Practice

Không deploy nếu có:

```text
CRITICAL
```

trừ khi có Exception Policy.