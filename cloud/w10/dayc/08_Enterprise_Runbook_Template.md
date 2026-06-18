# Enterprise Runbook Template

## Mục tiêu

Xây dựng mẫu Runbook chuẩn Enterprise.

---

# 1. Incident Name

Tên sự cố.

Ví dụ:

```text
High Error Rate on API Gateway
```

:contentReference[oaicite:3]{index=3}

---

# 2. Symptoms

Dấu hiệu nhận biết.

Ví dụ:

- HTTP 5xx tăng mạnh
- Latency > 2000ms
- Người dùng không đăng nhập được

:contentReference[oaicite:4]{index=4}

---

# 3. Detection

Nguồn phát hiện.

Ví dụ:

### Prometheus Alert

```text
HTTPRequestsFivePercentErrors
```

---

### Grafana Dashboard

```text
API Gateway Metrics
```

:contentReference[oaicite:5]{index=5}

---

# 4. Diagnosis

Quy trình chẩn đoán.

---

## Bước 1

Kiểm tra Pod.

```bash
kubectl get pods \
-n production \
-l app=api-gateway
```

Mục tiêu:

```text
CrashLoopBackOff
OOMKilled
```

:contentReference[oaicite:6]{index=6}

---

## Bước 2

Kiểm tra chi tiết Pod.

```bash
kubectl describe pod <pod-name> \
-n production
```

Tìm:

- Resource Issues
- Probe Failures
- Scheduling Problems

:contentReference[oaicite:7]{index=7}

---

## Bước 3

Kiểm tra Logs.

```bash
kubectl logs \
--tail=100 \
-n production \
-l app=api-gateway
```

Tìm:

- Timeout
- Database Error
- Application Error

:contentReference[oaicite:8]{index=8}

---

# 5. Recovery

Khôi phục hệ thống.

---

## Rollback

Nếu lỗi xuất hiện sau deploy.

```bash
kubectl rollout undo \
deployment/api-gateway \
-n production
```

:contentReference[oaicite:9]{index=9}

---

## Restart

Nếu Pod bị treo tạm thời.

```bash
kubectl rollout restart \
deployment/api-gateway \
-n production
```

:contentReference[oaicite:10]{index=10}

---

# 6. Escalation

Nếu không xử lý được sau:

```text
15 phút
```

thì phải báo cáo.

:contentReference[oaicite:11]{index=11}

---

## Platform Team

Khi nghi ngờ:

- Kubernetes
- Network
- Infrastructure

---

## Backend Team

Khi nghi ngờ:

- Code
- Database
- Logic

:contentReference[oaicite:12]{index=12}

---

# 7. Postmortem

Sau khi Incident kết thúc.

---

## Root Cause

Nguyên nhân gốc.

---

## Impact

Ảnh hưởng thực tế.

---

## Action Items

Ví dụ:

- Sửa Code
- Tăng Monitoring
- Cập nhật Alert
- Cập nhật Runbook

:contentReference[oaicite:13]{index=13}

---

## Template Chuẩn

```text
Incident Name
    ↓
Symptoms
    ↓
Detection
    ↓
Diagnosis
    ↓
Recovery
    ↓
Escalation
    ↓
Postmortem
```