kubectl scale --replicas=4 deployment/backend-zone-aware
# We should see that the new pod goes to zone b.