# ValidatingAdmissionPolicy (VAP)

## Mục tiêu

Hiểu Admission Policy Native của Kubernetes.

---

## VAP là gì?

Từ Kubernetes 1.30:

```text
GA
```

VAP trở thành giải pháp Policy tích hợp sẵn.

---

## Ưu điểm

### Không cần Webhook

Không cần:

```text
OPA
Gatekeeper
Webhook Server
```

---

### Không cần Rego

Sử dụng:

```text
CEL
```

---

### Hiệu năng cao

Chạy trực tiếp trong:

```text
kube-apiserver
```

---

## Thành phần

### ValidatingAdmissionPolicy

Định nghĩa logic.

---

### ValidatingAdmissionPolicyBinding

Kích hoạt policy.

---

## Ví dụ giới hạn Replica

```yaml
validations:
- expression:
    "object.spec.replicas <= 5"
```

---

## Binding

```yaml
validationActions:
- Deny
```

---

## Validation Actions

### Deny

Chặn request.

---

### Warn

Cho deploy.

Hiện cảnh báo.

---

### Audit

Cho deploy.

Ghi Audit Log.

---

## So sánh VAP và Gatekeeper

| Tiêu chí   | Gatekeeper | VAP     |
| ---------- | ---------- | ------- |
| Ngôn ngữ   | Rego       | CEL     |
| Webhook    | Có         | Không   |
| Controller | Có         | Không   |
| Hiệu năng  | Tốt        | Rất cao |
| Dễ học     | Trung bình | Dễ      |

---

## Khi nào dùng?

### Dùng VAP

* Chặn latest tag
* Bắt buộc label
* Giới hạn replicas
* Cấm privileged container

---

### Dùng Gatekeeper

* Logic phức tạp
* Cross-resource validation
* Compliance Framework
* Enterprise Governance

---

## Kết luận

Đối với phần lớn doanh nghiệp hiện nay:

```text
80%
→ VAP

20%
→ Gatekeeper
```

VAP đang trở thành xu hướng mặc định của Kubernetes hiện đại.
