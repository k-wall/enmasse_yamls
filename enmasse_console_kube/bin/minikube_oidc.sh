#!/bin/bash

#https://www.redhat.com/sysadmin/fedora-31-control-group-v2 - needed to turn off cgroup2


minikube start --v=5 \
--extra-config=apiserver.oidc-issuer-url=https://accounts.google.com \
--extra-config=apiserver.oidc-client-id=${CLIENT_ID} \
--extra-config=apiserver.oidc-username-claim=sub
#--extra-config=apiserver.oidc-username-claim=email

minikube addons enable ingress

kubectl patch  -n kube-system  deployment/nginx-ingress-controller --type=json -p '[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--enable-ssl-passthrough"}]'



