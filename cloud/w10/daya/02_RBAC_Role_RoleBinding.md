# RBAC - Role và RoleBinding

## Mô hình RBAC

```text
Subject
   ↓
Role
   ↓
RoleBinding
```

---

## Role là gì?

Role là tập hợp quyền trong một Namespace.

Ví dụ:

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role

metadata:
  name: pod-reader
  namespace: dev

rules:
- apiGroups: [""]
  resources:
    - pods
    - pods/log
  verbs:
    - get
    - list
    - watch
```

---

## Các thành phần quan trọng

### apiGroups

Core API Group:

```yaml
apiGroups: [""]
```

Deployment:

```yaml
apiGroups:
- apps
```

Ingress:

```yaml
apiGroups:
- networking.k8s.io
```

---

### Resources

Ví dụ:

```yaml
pods
services
configmaps
deployments
```

---

### Verbs

Các hành động:

```yaml
get
list
watch
create
update
patch
delete
```

---

## RoleBinding

RoleBinding dùng để gán Role cho:

* User
* Group
* ServiceAccount

Ví dụ:

```yaml
kind: RoleBinding
metadata:
  name: read-pods
  namespace: dev

subjects:
- kind: ServiceAccount
  name: app-sa
  namespace: dev

roleRef:
  kind: Role
  name: pod-reader
```

---

## Lưu ý

RoleBinding phải cùng namespace với Role.

---

## Best Practice

Tạo các Role dùng chung:

```text
reader
developer
operator
admin
```

Sau đó gán bằng nhiều RoleBinding khác nhau.
