#!/bin/bash
echo "Creating zone aware deployment of A2"

kind create cluster --name kind-2 --config ./kind/cluster-config.yaml

echo "Create zone aware deployment"
kubectl apply -f ./manifests/backend_deployment_zone_aware.yaml --context kind-kind-2
kubectl wait --for=condition=ready pod -l app=backend-zone-aware --timeout 180s --context kind-kind-2

echo "Create service for zone aware deployment"
kubectl apply -f ./manifests/backend_service_zone_aware.yaml --context kind-kind-2

echo "Create nginx-ingress-controller"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml --context kind-kind-2
kubectl wait --namespace=ingress-nginx --for=condition=ready pod -l app.kubernetes.io/component=controller --timeout=180s

echo "Create ingress for zone aware deployment"
kubectl apply -f ./manifests/backend_ingress_zone_aware.yaml --context kind-kind-2

echo Done creating ingress

sleep 30s