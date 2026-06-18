# Chaos Mesh và Chaos Experiments

## Chaos Mesh

Dự án CNCF phổ biến nhất cho Kubernetes Chaos Engineering. :contentReference[oaicite:4]{index=4}

---

## Các loại Chaos

### Pod Failure

```text
Delete Pod ngẫu nhiên
```

Kỳ vọng:

```text
Kubernetes tạo Pod mới
```

:contentReference[oaicite:5]{index=5}

---

### Node Failure

Giả lập:

```text
Node chết
```

Kỳ vọng:

```text
Pod Reschedule
```

:contentReference[oaicite:6]{index=6}

---

### CPU Stress

Ép CPU:

```text
100%
```

Kiểm tra:

```text
HPA Scale Out
```

:contentReference[oaicite:7]{index=7}

---

### Memory Stress

Gây:

```text
OOMKilled
```

Kiểm tra cơ chế phục hồi. :contentReference[oaicite:8]{index=8}

---

### Network Latency

Thêm:

```text
+2000ms
```

Kiểm tra:

- Retry
- Timeout
- Circuit Breaker

:contentReference[oaicite:9]{index=9}

---

### Packet Loss

Mất:

```text
10% packets
```

Kiểm tra độ ổn định ứng dụng. :contentReference[oaicite:10]{index=10}

---

## Công cụ

- Chaos Mesh
- LitmusChaos
- Gremlin

:contentReference[oaicite:11]{index=11}