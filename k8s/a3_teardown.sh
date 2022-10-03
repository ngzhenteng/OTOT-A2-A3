#!/bin/bash

echo "Cleaning up a3"

echo "Deleting Horizontal Pod Autoscaler"
kubectl delete hpa backend-hpa

echo "Deleting Metrics Server"
kubectl delete deployment metrics-server -n kube-system

echo "Done deleting all a3 resources!"

bash ./a2_cleanup.sh

echo "Done cleaning up a2 resources!"
