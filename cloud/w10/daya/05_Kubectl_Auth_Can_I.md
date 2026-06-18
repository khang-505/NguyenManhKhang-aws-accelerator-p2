# kubectl auth can-i

## Mục tiêu

Kiểm tra quyền thực tế của User hoặc ServiceAccount.

---

## Bản chất

Lệnh này hỏi trực tiếp API Server:

```text
Danh tính này có được phép làm việc này không?
```

Kết quả:

```text
yes
```

hoặc

```text
no
```

---

## Kiểm tra tài khoản hiện tại

```bash
kubectl auth can-i create deployments
```

Ví dụ:

```bash
kubectl auth can-i delete pods
```

---

## Kiểm tra theo Namespace

```bash
kubectl auth can-i delete pods -n dev
```

---

## Impersonation

Dùng cờ:

```bash
--as
```

---

## Kiểm tra User

```bash
kubectl auth can-i delete pods \
--as=user1 \
-n dev
```

---

## Kiểm tra ServiceAccount

Cú pháp chuẩn:

```text
system:serviceaccount:<namespace>:<sa-name>
```

Ví dụ:

```bash
kubectl auth can-i list pods \
--as=system:serviceaccount:dev:app-sa \
-n dev
```

---

## Liệt kê toàn bộ quyền

```bash
kubectl auth can-i \
--list \
--as=system:serviceaccount:dev:app-sa \
-n dev
```

Ví dụ kết quả:

```text
pods         get list watch
pods/log     get
services     get list
```

---

## Kiểm tra Sub-resource

### Logs

```bash
kubectl auth can-i get pods/log
```

---

### Exec

```bash
kubectl auth can-i create pods/exec
```

Lưu ý:

```text
kubectl exec
=
create pods/exec
```

---

## Workflow xử lý lỗi 403

### Bước 1

Xác định:

```text
Ai?
Làm gì?
Tài nguyên nào?
Namespace nào?
```

### Bước 2

Dùng:

```bash
kubectl auth can-i
```

### Bước 3

Nếu no:

```bash
kubectl auth can-i --list
```

và sửa Role hoặc ClusterRole.

---

## Best Practice

Mọi lỗi RBAC đều nên bắt đầu bằng:

```bash
kubectl auth can-i
```
