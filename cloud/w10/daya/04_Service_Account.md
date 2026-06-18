# Service Account trong Kubernetes

## Mục tiêu

Hiểu cách Kubernetes cấp danh tính cho Workload chạy bên trong Cluster.

---

## User Account vs Service Account

Kubernetes phân biệt hai loại Identity:

### User Account

Dành cho con người:

* Admin
* DevOps
* Developer

Xác thực bằng:

* Certificate
* Password
* OIDC

---

### Service Account

Dành cho:

* Pod
* Deployment
* Controller
* Job

Là tài nguyên Kubernetes chuẩn.

Ví dụ:

```yaml
apiVersion: v1
kind: ServiceAccount

metadata:
  name: app-sa
  namespace: dev
```

---

## Tại sao cần Service Account?

Ứng dụng bên trong Pod đôi khi cần gọi Kubernetes API.

Ví dụ:

### Prometheus

Cần:

```text
List Pods
List Services
List Endpoints
```

---

### ArgoCD

Cần:

```text
Create Deployment
Update Service
Delete Pod
```

---

### Jenkins

Cần:

```text
Deploy ứng dụng
Scale workload
```

---

## Gắn Service Account vào Pod

```yaml
spec:
  serviceAccountName: app-sa
```

Ví dụ:

```yaml
apiVersion: apps/v1
kind: Deployment

spec:
  template:
    spec:
      serviceAccountName: app-sa
```

---

## Cơ chế hoạt động

Kubernetes tự động tạo:

```text
JWT Token
```

và mount vào Pod.

Đường dẫn:

```text
/var/run/secrets/kubernetes.io/serviceaccount/
```

---

## Các file được mount

### token

JWT Token dùng xác thực.

---

### namespace

Namespace hiện tại.

---

### ca.crt

Certificate của API Server.

---

## ServiceAccount Token Projection

```text
Pod
 ↓
Service Account
 ↓
JWT Token
 ↓
Mounted Volume
 ↓
Application
```

---

## Best Practice

### Principle of Least Privilege

Không dùng:

```text
default ServiceAccount
```

cho Production.

---

### Tạo riêng từng SA

Ví dụ:

```text
prometheus-sa
argocd-sa
jenkins-sa
backend-sa
```

---

### Chỉ cấp quyền tối thiểu

Không cấp:

```text
cluster-admin
```

nếu không thực sự cần.
