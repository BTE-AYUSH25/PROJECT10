# 🚀 Kubernetes Canary Deployment with K3s + Istio  
**Automatically roll out new features safely with traffic splitting!**  

## 🛠️ Setup  
1. **Install K3s**: Run `./k3s-istio-setup/install-k3s.sh`  
2. **Deploy Istio**: Run `./k3s-istio-setup/install-istio.sh`  
3. **Deploy Apps**: `kubectl apply -f kubernetes-manifests/`  
canary-deployment-hackathon/  
├── k3s-istio-setup/          # K3s + Istio installation scripts  
│   ├── install-k3s.sh        # Quick K3s setup  
│   ├── install-istio.sh      # Helm-based Istio install  
│   └── verify-setup.sh       # Checks cluster readiness  
├── app/                      # Sample app (v1 & v2)  
│   ├── app-v1/               # Stable version  
│   │   ├── Dockerfile  
│   │   ├── app.py (or server.js)  
│   │   └── requirements.txt (if Python)  
│   └── app-v2/               # Canary version (modified response)  
│       ├── Dockerfile  
│       └── app.py  
├── kubernetes-manifests/     # K8s YAML files  
│   ├── deployment-v1.yaml    # Stable deployment  
│   ├── deployment-v2.yaml    # Canary deployment  
│   ├── service.yaml          # Kubernetes Service  
│   ├── virtualservice.yaml   # Istio traffic-splitting rules  
│   └── gateway.yaml          # Istio Ingress Gateway  
├── monitoring/               # Observability (optional but impressive)  
│   ├── prometheus-values.yaml  # Helm values for Prometheus  
│   ├── grafana-dashboard.json  # Pre-configured dashboard  
│   └── alerts.yaml           # Alertmanager rules  
├── automation/               # Bonus: Auto-rollback scripts  
│   ├── rollback-on-failure.sh # Watches errors & shifts traffic  
│   └── chaos-test.sh         # Simulates pod failure  
└── README.md                 # Clear setup/demo instructions  
## 🎥 Demo  
- **View traffic splitting**:  
  ```bash
  watch -n 1 'curl http://YOUR_IP'
