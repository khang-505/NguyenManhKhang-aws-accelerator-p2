#!/bin/bash

set -e

sudo -u ubuntu kubectl apply -f /home/ubuntu/deployment.yaml

sudo -u ubuntu kubectl apply -f /home/ubuntu/service.yaml

sleep 10
kubectl rollout status deployment/xbrain-app

pkill -f "kubectl port-forward" || true

nohup kubectl port-forward svc/nginx-service 30080:80 --address 0.0.0.0 >/tmp/pf.log 2>&1 &
sudo -u ubuntu kubectl get pods

sudo -u ubuntu kubectl get svc