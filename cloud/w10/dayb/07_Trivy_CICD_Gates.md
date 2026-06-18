# Trivy trong CI/CD

## Mục tiêu

Biến Trivy thành Security Gate.

---

## Vấn đề

Mặc định:

```bash
trivy image nginx
```

Pipeline vẫn PASS.

---

## Chặn Pipeline

```bash
trivy image \
--severity HIGH,CRITICAL \
--exit-code 1 \
my-image:latest
```

---

## Ý nghĩa

### severity

Chỉ xét:

```text
HIGH
CRITICAL
```

---

### exit-code 1

Nếu phát hiện lỗi:

```text
Pipeline FAIL
```

---

## Workflow

```text
Code Push
    ↓
Build
    ↓
Trivy Scan
    ↓
PASS?
   / \
 YES  NO
 ↓     ↓
Push  Stop
```

---

## GitHub Actions

```yaml
- name: Scan
  run: |
    trivy image \
    --severity HIGH,CRITICAL \
    --exit-code 1 \
    myapp:${{ github.sha }}
```

---

## Kết quả

Có CVE:

```text
Exit Code = 1
```

Không CVE:

```text
Exit Code = 0
```

---

## Best Practice

Fail nếu:

- CRITICAL > 0
- HIGH > 0

Production Pipeline.