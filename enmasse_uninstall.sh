#!/bin/bash
kubectl delete crd -l app=enmasse
kubectl delete crd -l app=enmasse --timeout=600s
kubectl delete clusterrolebindings -l app=enmasse
kubectl delete clusterroles -l app=enmasse
kubectl delete apiservices -l app=enmasse
kubectl delete oauthclients -l app=enmasse
