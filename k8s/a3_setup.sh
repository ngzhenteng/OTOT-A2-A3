#!/bin/bash

echo Setting up a2 deployment
bash ./a2_setup.sh

sleep 30s

# Create metrics server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.5.0/components.yaml
# Set flags for metric server
kubectl patch -n kube-system deployment metrics-server --type=json -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'
# wait for pod to be ready
kubectl wait --for=condition=ready pod -l k8s-app=metrics-server --timeout=240s --context kind-kind-1 -n kube-system
# Create HPA
kubectl apply -f ./manifests/backend_hpa.yaml

kubectl wait --for=condition=abletoscale hpa backend-hpa
# Verify HPA works...
