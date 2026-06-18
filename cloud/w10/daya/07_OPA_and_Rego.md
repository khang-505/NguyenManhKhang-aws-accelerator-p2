# OPA và Rego

## OPA là gì?

OPA (Open Policy Agent) là Policy Engine mã nguồn mở thuộc CNCF.

---

## Mô hình hoạt động

```text
Request
 ↓
JSON Input
 ↓
OPA
 ↓
Rego Policy
 ↓
Allow / Deny
```

---

## Lợi ích

Một ngôn ngữ policy cho:

* Kubernetes
* Terraform
* API Gateway
* Service Mesh

---

## Rego là gì?

Ngôn ngữ khai báo dùng để viết Policy.

Tư duy:

```text
Tìm bằng chứng vi phạm
```

---

## Ví dụ chặn latest tag

```rego
package kubernetes

deny[msg] {

 input.request.kind.kind == "Pod"

 container :=
 input.request.object.spec.containers[_]

 endswith(container.image, ":latest")

 msg :=
 sprintf(
 "Image '%v' dùng latest",
 [container.image]
 )
}
```

---

## Quy tắc quan trọng

Trong cùng block:

```rego
{
 condition1
 condition2
 condition3
}
```

được hiểu là:

```text
AND
```

---

## Biến

```rego
namespace :=
input.request.object.metadata.namespace
```

---

## So sánh

```rego
replicas > 3
```

```rego
replicas <= 5
```

---

## Violation

Trong Gatekeeper thường dùng:

```rego
violation[{"msg": msg}]
```

thay cho:

```rego
deny[msg]
```

---

## Công cụ học tập

Rego Playground

Cho phép:

* Test Policy
* Test JSON Input
* Debug Rule
