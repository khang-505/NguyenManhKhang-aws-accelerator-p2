# Authentication vs Authorization trong Kubernetes

## Mục tiêu

Hiểu luồng request đi qua Kubernetes API Server trước khi được ghi vào etcd.

---

## Request Lifecycle

```text
Request
   ↓
Authentication
   ↓
Authorization
   ↓
Admission Controller
   ↓
etcd
```

---

## Authentication (AuthN)

Authentication trả lời câu hỏi:

```text
Bạn là ai?
```

Kubernetes không có database quản lý user riêng.

Các cơ chế xác thực phổ biến:

### X.509 Client Certificate

Thường dùng cho:

* Cluster Admin
* kubeconfig

### Bearer Token / OIDC

Tích hợp:

* Google
* Okta
* Keycloak
* GitHub

### ServiceAccount Token

Dành cho:

* Pod
* Workload trong Cluster

---

## Kết quả Authentication

Nếu thành công:

```text
Username
Groups
```

Ví dụ:

```text
User: tuan-admin
Group: dev-team
```

Nếu thất bại:

```text
401 Unauthorized
```

---

## Authorization (AuthZ)

Authorization trả lời câu hỏi:

```text
Bạn được làm gì?
```

Kubernetes sử dụng:

* RBAC
* ABAC
* Webhook

Trong thực tế chủ yếu dùng RBAC.

---

## Ví dụ

```bash
kubectl create deployment nginx
```

K8s kiểm tra:

1. User là ai
2. Thuộc nhóm nào
3. Có quyền create deployment hay không

Nếu không có quyền:

```text
403 Forbidden
```

---

## Admission Controller

Đây là lớp bảo vệ cuối cùng.

Nhiệm vụ:

* Validate manifest
* Mutate manifest
* Kiểm tra policy

Ví dụ:

* Chặn image latest
* Kiểm tra ResourceQuota
* Inject Sidecar

---

## Tổng kết

Authentication

```text
Who are you?
```

Authorization

```text
What can you do?
```

Admission Controller

```text
Is this manifest allowed?
```
