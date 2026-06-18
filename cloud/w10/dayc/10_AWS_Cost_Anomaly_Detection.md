# AWS Cost Anomaly Detection

## Mục tiêu

Phát hiện Cost Spike ngay trong ngày thay vì đợi hóa đơn cuối tháng.

:contentReference[oaicite:26]{index=26}

---

## Công nghệ

AWS sử dụng:

```text
Machine Learning
```

để học mô hình chi tiêu bình thường.

:contentReference[oaicite:27]{index=27}

---

## Workflow

```text
AWS Billing
      ↓
Cost Anomaly Detection
      ↓
SNS
      ↓
Email / Slack
      ↓
Platform Team
```

:contentReference[oaicite:28]{index=28}

---

## Bước 1

AWS Billing liên tục cập nhật dữ liệu chi phí.

:contentReference[oaicite:29]{index=29}

---

## Bước 2

Cost Anomaly Detection phân tích.

Ví dụ:

```text
CloudWatch tăng đột biến
```

↓

Anomaly.

:contentReference[oaicite:30]{index=30}

---

## Bước 3

SNS gửi cảnh báo.

Kênh hỗ trợ:

- Email
- Slack
- Teams
- Webhook

:contentReference[oaicite:31]{index=31}

---

## Thiết lập

### Bước 1

Mở:

```text
AWS Cost Management
```

↓

Cost Anomaly Detection.

:contentReference[oaicite:32]{index=32}

---

### Bước 2

Create Monitor.

Loại phổ biến:

#### AWS Services

Theo dõi:

- EC2
- EKS
- S3
- CloudWatch

:contentReference[oaicite:33]{index=33}

---

#### Linked Account

Theo dõi nhiều Account.

:contentReference[oaicite:34]{index=34}

---

### Bước 3

Create Subscription.

Khuyến nghị:

```text
Immediate Alert
```

:contentReference[oaicite:35]{index=35}

---

### Bước 4

Set Threshold.

---

Sandbox

```text
10 USD
```

---

Dev/Staging

```text
20 - 50 USD
```

---

Production

```text
100 - 500+ USD
```

:contentReference[oaicite:36]{index=36}

---

## Cost Incident Response

```text
Cost Spike
      ↓
Alert
      ↓
Investigation
      ↓
Root Cause
      ↓
Fix
      ↓
Cost Recovery
```

---

## Tích hợp Platform

```text
ResourceQuota
      ↓
LimitRange
      ↓
KubeCost
      ↓
Cost Anomaly Detection
      ↓
Slack Alert
```

---

## Kết luận

AWS Cost Anomaly Detection là lớp bảo vệ cuối cùng chống:

- Cost Spike
- Cloud Waste
- Crypto Mining
- Resource Leak

trước khi chúng trở thành hóa đơn AWS khổng lồ.