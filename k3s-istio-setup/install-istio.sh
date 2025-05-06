#!/bin/bash
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm install istio-base istio/base -n istio-system --create-namespace
helm install istiod istio/istiod -n istio-system --wait
kubectl label namespace default istio-injection=enabled
echo "Istio installed! Verify with 'kubectl get pods -n istio-system'"
