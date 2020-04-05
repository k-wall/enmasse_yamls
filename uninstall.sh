#!/bin/bash

oc delete crd -l app=enmasse,enmasse-component=iot
oc delete crd -l app=enmasse --timeout=600s
oc delete apiservices -l app=enmasse --timeout=600s
oc delete clusterrolebindings -l app=enmasse
oc delete clusterroles -l app=enmasse
oc delete apiservices -l app=enmasse
oc delete oauthclients -l app=enmasse
oc delete consolelinks -l app=enmasse
