# ResourceQuota Fundamentals

## Mục tiêu

Ngăn chặn việc một Namespace tiêu thụ toàn bộ tài nguyên Cluster.

---

## ResourceQuota là gì?

ResourceQuota là cơ chế giới hạn tổng lượng tài nguyên mà một Namespace được phép sử dụng.

---

## Vấn đề

Không có ResourceQuota:

```text
Developer A
    ↓
100 Pods
    ↓
CPU cạn kiệt
    ↓
Cluster ảnh hưởng
```

---

## ResourceQuota kiểm soát

### Compute

- CPU
- Memory

### Objects

- Pods
- Services
- ConfigMaps
- Secrets

### Storage

- PVC
- Requests Storage

---

## Ví dụ

```yaml
apiVersion: v1
kind: ResourceQuota

metadata:
  name: team-a-quota

spec:
  hard:
    requests.cpu: "4"
    requests.memory: 8Gi

    limits.cpu: "8"
    limits.memory: 16Gi

    pods: "20"
```

---

## Hành vi

Namespace đã dùng:

```text
CPU Request = 4
```

Dev tạo thêm Pod:

```text
Request CPU = 1
```

Kubernetes:

```text
Reject
```

---

## Lợi ích

- Multi-Tenancy
- Cost Control
- Capacity Protection
- Fair Usage

---

## Best Practice

Mỗi Namespace Production nên có:

```text
ResourceQuota
+
LimitRange
```