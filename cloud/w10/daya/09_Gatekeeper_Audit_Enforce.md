# Gatekeeper Audit và Enforce

## Audit Mode

```yaml
enforcementAction: dryrun
```

---

## Hành vi

Policy vẫn chạy.

Nhưng:

```text
Không chặn
```

---

## Audit Loop

Gatekeeper liên tục quét:

```text
Pods
Deployments
Namespaces
```

---

## Xem vi phạm

```bash
kubectl get constraint \
<name> \
-o yaml
```

Kiểm tra:

```yaml
status:
  violations:
```

---

## Enforce Mode

```yaml
enforcementAction: deny
```

---

## Hành vi

Request vi phạm:

```text
Bị chặn ngay
```

---

## Ví dụ

```text
image: nginx:latest
```

Kết quả:

```text
403 Forbidden
```

---

## So sánh

| Tiêu chí        | Audit      | Enforce    |
| --------------- | ---------- | ---------- |
| Chặn Request    | Không      | Có         |
| Audit Cluster   | Có         | Có         |
| Dùng Production | Thử nghiệm | Chính thức |

---

## Quy trình triển khai

```text
Viết Policy
 ↓
DryRun
 ↓
Audit
 ↓
Fix Violation
 ↓
Deny
```

---

## Best Practice

Không bật deny ngay trên Production.

Luôn:

```text
Audit trước
Enforce sau
```
