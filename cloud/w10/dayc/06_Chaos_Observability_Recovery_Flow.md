# Chaos Observability Recovery Flow

## Chu trình chuẩn

```text
Inject Failure
      ↓
Prometheus
      ↓
Alertmanager
      ↓
Runbook
      ↓
Recovery
```

:contentReference[oaicite:12]{index=12}

---

## Bước 1

Chaos Mesh tạo lỗi.

Ví dụ:

```text
Network Latency 3s
```

---

## Bước 2

Prometheus phát hiện:

- Error Rate tăng
- Latency tăng

:contentReference[oaicite:13]{index=13}

---

## Bước 3

Alertmanager gửi:

- Slack
- Email
- PagerDuty

:contentReference[oaicite:14]{index=14}

---

## Bước 4

Engineer mở Runbook.

---

## Bước 5

Chaos kết thúc.

Hệ thống trở lại trạng thái bình thường.

:contentReference[oaicite:15]{index=15}

---

## Ý nghĩa

Chaos chỉ có giá trị khi kết hợp:

```text
Observability
+
Alerting
+
Runbook
```