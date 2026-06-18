# Supply Chain Attack Fundamentals

## Mục tiêu

Hiểu khái niệm Supply Chain Attack và các điểm tấn công trong vòng đời phát triển phần mềm.

---

## Supply Chain Attack là gì?

Supply Chain Attack là hình thức tấn công vào:

- Source Code
- Dependency
- CI/CD Pipeline
- Container Image
- Registry

thay vì tấn công trực tiếp Production.

---

## Tại sao hacker thích kiểu tấn công này?

Production thường có:

- Firewall
- WAF
- IPS
- Monitoring

nên rất khó xâm nhập.

Ngược lại:

```text
Development
Build
Dependency
CI/CD
```

thường ít được bảo vệ hơn.

---

## Attack Vector Pipeline

```text
Source Code
      ↓
Build Pipeline
      ↓
Container Image
      ↓
Registry
      ↓
Kubernetes
      ↓
Production
```

---

## 1. Source Code Attack

### Kịch bản

Hacker:

- Chiếm tài khoản Developer
- Commit mã độc
- Pull Request độc hại

---

### Dependency Attack

Ví dụ:

```text
requests
```

bị giả mạo thành:

```text
reqeusts
```

---

## 2. Build Pipeline Attack

CI/CD bị compromise.

Ví dụ:

- Jenkins
- GitHub Actions
- GitLab CI

---

### Hậu quả

Build Script bị sửa:

```text
Inject Backdoor
```

vào ứng dụng.

---

## 3. Container Image Attack

### Base Image độc hại

Ví dụ:

```dockerfile
FROM ubuntu:latest
```

nhưng image đã bị cài:

- Crypto Miner
- Trojan
- Malware

---

## 4. Registry Attack

Hacker thay thế:

```text
Image sạch
```

bằng:

```text
Image độc
```

cùng tag.

Ví dụ:

```text
app:latest
```

---

## 5. Kubernetes Attack

Kubernetes kéo Image độc hại.

```text
Registry
   ↓
K8s Pull
   ↓
Pod Running
```

---

## Các ví dụ thực tế

### Dependency Confusion

Upload package độc lên:

- npm
- PyPI

---

### Typosquatting

Tên gần giống package thật.

Ví dụ:

```text
requests
reqeusts
```

---

### Hardcoded Secrets

Developer commit:

- API Key
- Database Password
- SSH Key

lên GitHub.

---

### SolarWinds

Một trong những Supply Chain Attack nổi tiếng nhất.

Hacker chiếm hệ thống build.

↓

Inject Malware

↓

Khách hàng tải bản cập nhật chính thức.

---

## Tác động

- Rò rỉ dữ liệu
- Chiếm Production
- Ransomware
- Mất uy tín doanh nghiệp

---

## Kết luận

Supply Chain Security không chỉ bảo vệ Production.

Mà phải bảo vệ:

```text
Code
↓
Build
↓
Image
↓
Registry
↓
Runtime
```