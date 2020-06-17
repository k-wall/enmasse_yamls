#!/bin/bash

oc debug node/$(oc get node --output=jsonpath='{.items[0].metadata.name}') -- bash -xc 'chroot /host bash -c "systemctl restart chronyd; systemctl  status chronyd"'
