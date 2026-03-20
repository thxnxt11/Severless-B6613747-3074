# Kubernetes Deployment Project

## ข้อมูลนักศึกษา

- **รหัสนักศึกษา:** B6613747
- **ชื่อ:** นายธานัท วรกันทรากร

---

## Project Overview

โครงการนี้เป็นการติดตั้ง Kubernetes Deployment สำหรับสามบริการหลัก:

1. **Nginx** - Web Server
2. **Jenkins** - CI/CD System
3. **Grafana** - Monitoring System

---

## Architecture Overview

### Nginx

![Nginx Architecture](pic/nginx.png)
Nginx ทำหน้าที่เป็น Reverse Proxy และ Load Balancer สำหรับรับเข้าจากภายนอก

### Jenkins

![Jenkins CI/CD](pic/jenkins.png)
Jenkins ใช้สำหรับ Continuous Integration / Continuous Delivery (CI/CD) pipelines

### Grafana

![Grafana Monitoring](pic/grafana.png)
Grafana ใช้สำหรับการสรุป และแสดงข้อมูลการตรวจสอบระบบ (Monitoring)

---

## Project Structure

```
k8s/
├── kustomization.yaml          # Kustomize configuration
├── namespace/
│   └── namespace.yaml          # Kubernetes namespaces definition
├── nginx/
│   ├── deployment/
│   │   └── deploy.yaml        # Nginx deployment manifest
│   ├── ingress/
│   │   └── ingress.yaml       # Ingress configuration
│   └── service/
│       └── service.yaml       # Service configuration
├── jenkins/
│   ├── deployment/
│   │   └── deploy.yaml        # Jenkins deployment manifest
│   ├── ingress/
│   │   └── ingress.yaml       # Ingress configuration
│   ├── pv/
│   │   └── pv.yaml           # PersistentVolume
│   ├── pvc/
│   │   └── pvc.yaml          # PersistentVolumeClaim
│   └── service/
│       └── service.yaml       # Service configuration
├── grafana/
│   ├── deployment/
│   │   └── deploy.yaml        # Grafana deployment manifest
│   ├── ingress/
│   │   └── ingress.yaml       # Ingress configuration
│   ├── pv/
│   │   └── pv.yaml           # PersistentVolume
│   ├── pvc/
│   │   └── pvc.yaml          # PersistentVolumeClaim
│   └── service/
│       └── service.yaml       # Service configuration
└── pic/                        # Project images
    ├── nginx.png
    ├── jenkins.png
    └── grafana.png
```

---

## Key Components

### 1. Kubernetes Namespaces

- **ci-cd** - สำหรับ Jenkins deployment
- **monitoring** - สำหรับ Grafana deployment
- **web** - สำหรับ Nginx deployment

### 2. Storage Configuration

- **PersistentVolume (PV)** - จัดเก็บข้อมูลแบบถาวร
- **PersistentVolumeClaim (PVC)** - ขอใช้พื้นที่จัดเก็บข้อมูล

### 3. Networking

- **Service** - เปิดให้เข้าถึงบริการภายในคลัสเตอร์
- **Ingress** - ควบคุมการเข้าถึงจากภายนอกคลัสเตอร์

### 4. Secrets Management

- Kustomize secretGenerator ใช้สำหรับจัดการ credentials
- Jenkins secret - เก็บข้อมูลการยืนยันตัวตน
- Grafana secret - เก็บข้อมูลการยืนยันตัวตน

---

## Deployment Instructions

### Prerequisites

- Kubernetes cluster (v1.20+)
- kubectl CLI tools
- Kustomize

### Apply Configurations

```bash
# Navigate to k8s directory
cd k8s

# Apply all configurations using Kustomize
kubectl apply -k .
```

### Verify Deployment

```bash
# Check namespaces
kubectl get namespaces

# Check all resources
kubectl get all --all-namespaces

# Check specific deployments
kubectl get deployments -n ci-cd
kubectl get deployments -n monitoring

# Check services
kubectl get services --all-namespaces

# Check ingress resources
kubectl get ingress --all-namespaces
```

---

## Access Services

หลังจากที่ Deployment สำเร็จ สามารถเข้าถึงบริการผ่าน:

| Service | URL                  | Namespace  |
| ------- | -------------------- | ---------- |
| Nginx   | http://nginx.local   | web        |
| Jenkins | http://jenkins.local | ci-cd      |
| Grafana | http://grafana.local | monitoring |

---

## สรุปผลลัพธ์

### ✅ Achievements

1. **Kubernetes Architecture**
   - ติดตั้ง 3 main services บน Kubernetes cluster
   - สร้าง separate namespaces สำหรับแต่ละบริการ
   - กำหนด resource management และ networking policies

2. **Storage Implementation**
   - ใช้ PersistentVolume และ PersistentVolumeClaim
   - Jenkins และ Grafana มี persistent storage สำหรับเก็บข้อมูล

3. **Networking Configuration**
   - Nginx เป็น Reverse Proxy / Load Balancer
   - Ingress controller สำหรับ external access
   - Service discovery ภายในคลัสเตอร์

4. **Security**
   - ใช้ Kustomize secretGenerator สำหรับ secret management
   - แยก credentials ออกจากคำจำกัดความแอปพลิเคชัน

5. **Monitoring & Logging**
   - Grafana สำหรับการเฝ้าดูระบบ
   - Jenkins สำหรับ CI/CD pipelines
   - Nginx สำหรับ routing และ load balancing

### 📊 Deployment Status

- ✅ Namespaces created
- ✅ Pods successfully running
- ✅ Services exposed
- ✅ Ingress configured
- ✅ Persistent storage configured
- ✅ Secrets managed

### 🔧 Technologies Used

- **Container Orchestration:** Kubernetes
- **Configuration Management:** Kustomize
- **Web Server:** Nginx
- **CI/CD:** Jenkins
- **Monitoring:** Grafana
- **Version Control:** Git

---

## Troubleshooting

### Check Pod Status

```bash
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace>
```

### Check Events

```bash
kubectl get events --all-namespaces --sort-by='.lastTimestamp'
```

### Verify Ingress

```bash
kubectl describe ingress <ingress-name> -n <namespace>
```

---

## References

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Kustomize Documentation](https://kustomize.io/)
- [Nginx Documentation](https://nginx.org/)
- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [Grafana Documentation](https://grafana.com/docs/)
