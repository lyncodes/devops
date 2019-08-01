#!/usr/bin/env bash
kubectl apply -f storageclass.yaml
kubectl apply -f headless.yaml
kubectl apply -f statefulset.yaml
sleep 180
kubectl cp initiate.js mongo-0:initiate.js
kubectl exec mongo-0 -- mongo load  initiate.js
