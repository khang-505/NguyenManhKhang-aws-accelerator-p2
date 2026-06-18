# OPA Gatekeeper

## Gatekeeper là gì?

Gatekeeper là Validating Admission Controller dựa trên OPA.

---

## Kiến trúc

```text
API Server
      ↓
Gatekeeper
      ↓
OPA Engine
      ↓
Allow / Deny
```

---

## Hai thành phần cốt lõi

### ConstraintTemplate

Định nghĩa logic.

Chứa:

```text
Rego
Schema
Parameters
```

---

### Constraint

Áp dụng logic vào thực tế.

Chứa:

```text
Match Scope
Parameters
```

---

## Tư duy

```text
ConstraintTemplate
=
Class
```

```text
Constraint
=
Object
```

---

## Ví dụ

Template:

```text
Bắt buộc có label
```

Constraint:

```text
Namespace prod
phải có label owner
```

---

## Quy trình

```text
ConstraintTemplate
 ↓
CRD mới
 ↓
Constraint
 ↓
Policy Enforcement
```

---

## Use Cases

* Chặn latest tag
* Bắt buộc label
* Cấm root container
* Kiểm tra livenessProbe
* Kiểm tra resource limit
