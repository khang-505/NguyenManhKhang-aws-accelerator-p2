# Resource Governance Strategy

## Mục tiêu

Kết hợp ResourceQuota và LimitRange để quản trị tài nguyên.

---

## Kiến trúc

```text
Namespace
    │
    ├── ResourceQuota
    │
    └── LimitRange
```

---

## Vai trò

### ResourceQuota

Kiểm soát:

```text
Tổng ngân sách
```

---

### LimitRange

Kiểm soát:

```text
Chi tiêu từng ứng dụng
```

---

## Ví dụ

Namespace:

```text
CPU = 20
Memory = 40Gi
```

---

Một Pod:

```text
CPU max = 2
Memory max = 2Gi
```

---

## Kết quả

Developer:

- Không thể tạo Pod quá lớn
- Không thể dùng quá quota

---

## Governance Layer

```text
Developer
      ↓
LimitRange
      ↓
ResourceQuota
      ↓
Scheduler
      ↓
Node
```

---

## Liên hệ Cost Control

Tài nguyên được kiểm soát

↓

Ít Node hơn

↓

Chi phí AWS thấp hơn