# ClusterRole và ClusterRoleBinding

## Khi nào dùng?

Khi cần:

* Toàn bộ cluster
* Nhiều namespace
* Node
* Namespace
* PersistentVolume

---

## ClusterRole

```yaml
kind: ClusterRole
metadata:
  name: cluster-reader

rules:
- apiGroups: [""]
  resources:
    - nodes
    - namespaces
  verbs:
    - get
    - list
    - watch
```

---

## ClusterRoleBinding

```yaml
kind: ClusterRoleBinding

subjects:
- kind: ServiceAccount
  name: monitoring
  namespace: monitoring

roleRef:
  kind: ClusterRole
  name: cluster-reader
```

---

## So sánh

| Tiêu chí           | Role  | ClusterRole |
| ------------------ | ----- | ----------- |
| Namespace          | Có    | Không       |
| Nodes              | Không | Có          |
| PV                 | Không | Có          |
| Namespace Resource | Không | Có          |

---

## Các lưu ý quan trọng

### RBAC là Additive

Không có deny.

Nếu có một Role cho phép:

```yaml
delete pods
```

Thì user có quyền delete.

---

### cluster-admin

Quyền cao nhất.

```yaml
*
```

cho:

* apiGroups
* resources
* verbs

Không nên cấp tràn lan.

---

### roleRef không sửa được

Muốn đổi:

```text
Delete Binding
Create lại
```
