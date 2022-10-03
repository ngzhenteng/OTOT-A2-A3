echo Deleting all resources for a3 zone aware

kubectl delete ingress backend-ingress-zone-aware --context=kind-kind-2

kubectl delete deploy -n ingress-nginx ingress-nginx-controller --context=kind-kind-2

kubectl delete service backend-service-zone-aware --context=kind-kind-2

kubectl delete deploy backend-zone-aware --context=kind-kind-2

kind delete cluster -n kind-2

echo Done deleting all resources for a3 zone aware