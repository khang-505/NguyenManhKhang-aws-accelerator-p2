# AWS Cost Guard

## Mục tiêu

Kiểm soát chi phí AWS trước khi hóa đơn tăng đột biến.

---

## Cloud Waste Problem

Một Platform có thể:

- An toàn
- Tự động hóa
- Quan sát tốt

nhưng vẫn:

```text
Tốn tiền quá mức
```

:contentReference[oaicite:14]{index=14}

---

## Cost Spike

Ví dụ:

### Chaos Testing quên tắt

↓

Tài nguyên chạy cả tuần.

---

### HPA cấu hình sai

↓

Scale hàng chục Node.

---

### CloudWatch Log Spam

↓

Terabyte Logs.

:contentReference[oaicite:15]{index=15}

---

## Cost Guard Architecture

```text
ResourceQuota
      ↓
Monitoring
      ↓
KubeCost
      ↓
Anomaly Detection
```

:contentReference[oaicite:16]{index=16}

---

# Layer 1

## ResourceQuota

Ngăn Dev:

```text
Tạo Pod vô hạn
```

:contentReference[oaicite:17]{index=17}

---

# Layer 2

## Monitoring

Prometheus

↓

KubeCost

↓

Dashboard

:contentReference[oaicite:18]{index=18}

---

## KubeCost

Cho biết:

- Namespace nào đắt nhất
- Pod nào đắt nhất
- Team nào tiêu tốn nhiều nhất

:contentReference[oaicite:19]{index=19}

---

# Layer 3

## AWS Cost Anomaly Detection

Machine Learning phát hiện:

```text
Chi phí bất thường
```

:contentReference[oaicite:20]{index=20}

---

# Cost Drivers

## EKS Control Plane

Khoảng:

```text
~73 USD/tháng
```

mỗi Cluster EKS.

:contentReference[oaicite:21]{index=21}

---

## EC2 Worker Nodes

Khoản chi lớn nhất.

Tối ưu:

- Karpenter
- Cluster Autoscaler
- Spot Instance

:contentReference[oaicite:22]{index=22}

---

## EBS

Nguy cơ:

```text
Orphaned Volume
```

vẫn bị tính phí.

:contentReference[oaicite:23]{index=23}

---

## NAT Gateway

Một trong các dịch vụ đắt nhất.

Tối ưu:

```text
VPC Endpoint
```

:contentReference[oaicite:24]{index=24}

---

## CloudWatch

Chi phí đến từ:

- Log Ingestion
- Log Storage

:contentReference[oaicite:25]{index=25}

---

## Best Practice

Production:

```text
ResourceQuota
+
KubeCost
+
Anomaly Detection
```