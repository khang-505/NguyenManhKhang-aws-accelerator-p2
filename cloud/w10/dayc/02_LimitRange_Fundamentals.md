# LimitRange Fundamentals

## Mục tiêu

Áp đặt giới hạn tài nguyên cho từng Pod hoặc Container.

---

## Khác biệt với ResourceQuota

### ResourceQuota

Giới hạn:

```text
Toàn Namespace
```

---

### LimitRange

Giới hạn:

```text
Từng Container
```

---

## Ví dụ

```yaml
apiVersion: v1
kind: LimitRange

metadata:
  name: app-limits

spec:
  limits:
  - type: Container

    defaultRequest:
      cpu: 100m
      memory: 128Mi

    default:
      cpu: 500m
      memory: 512Mi

    max:
      cpu: "2"
      memory: 2Gi
```

---

## Hai cơ chế chính

### Defaulting

Nếu Dev quên khai báo resources:

```yaml
containers:
- image: nginx
```

Kubernetes tự động inject:

```text
requests.cpu=100m
requests.memory=128Mi

limits.cpu=500m
limits.memory=512Mi
```

:contentReference[oaicite:0]{index=0}

---

### Validation

Nếu Dev khai báo:

```yaml
limits:
  cpu: "4"
```

trong khi max là:

```text
2 CPU
```

Kubernetes từ chối request ngay lập tức. :contentReference[oaicite:1]{index=1}

---

## Lợi ích

- Ngăn Pod tham lam
- Scheduler hoạt động chính xác
- Tránh OOM toàn Node