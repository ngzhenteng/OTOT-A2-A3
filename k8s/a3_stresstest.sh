#!/bin/bash

kubectl describe hpa --context kind-kind-1 

requests=800

for ((i = 0 ; i < $requests ; i++))
do
    echo request number $i
    curl --silent --show-error --output /dev/null http://localhost
done

kubectl describe hpa --context kind-kind-1 