# Runbook Fundamentals

## Runbook là gì?

Runbook là tài liệu hướng dẫn xử lý sự cố được chuẩn hóa dành cho:

- SRE
- DevOps
- Platform Engineer
- SysAdmin

Mục tiêu là giúp kỹ sư nhanh chóng:

- Chẩn đoán
- Cô lập
- Khắc phục

một loại sự cố cụ thể.

:contentReference[oaicite:0]{index=0}

---

## Vấn đề khi không có Runbook

Khi Alert xuất hiện:

```text
CPU tăng cao
API lỗi
Database Timeout
```

Engineer phải:

```text
Đoán nguyên nhân
Google
Hỏi đồng nghiệp
```

Điều này làm tăng:

```text
MTTR
```

---

## MTTR là gì?

Mean Time To Resolution

```text
Thời gian trung bình
để khôi phục hệ thống
```

Mục tiêu:

```text
MTTR càng thấp càng tốt
```

:contentReference[oaicite:1]{index=1}

---

## Vai trò của Runbook

```text
Prometheus Alert
       ↓
Runbook
       ↓
Diagnosis
       ↓
Recovery
```

:contentReference[oaicite:2]{index=2}

---

## Lợi ích

### Chuẩn hóa xử lý

Mọi kỹ sư xử lý giống nhau.

---

### Giảm phụ thuộc cá nhân

Không phụ thuộc:

```text
Senior Engineer
```

---

### Đào tạo nhân sự mới

Người mới vẫn có thể xử lý Incident.

---

### Giảm MTTR

Engineer không cần:

```text
Suy đoán
```

mà làm theo quy trình có sẵn.

---

## Runbook vs Playbook

### Runbook

Giải quyết:

```text
Một sự cố cụ thể
```

Ví dụ:

```text
API 5xx tăng cao
```

---

### Playbook

Giải quyết:

```text
Một nhóm sự cố
```

Ví dụ:

```text
Database Incident Response
```

---

## Best Practice

Mỗi Alert quan trọng nên có:

```text
Link Runbook
```

đính kèm trực tiếp trong Alertmanager.