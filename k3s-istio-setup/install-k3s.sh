#!/bin/bash
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
echo "K3s installed! Run 'kubectl get nodes' to verify."
