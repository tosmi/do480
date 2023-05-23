#!/usr/bin/bash

oc login -u admin -p redhat https://api.ocp4-mng.example.com:6443

sudo ansible-playbook /home/student/DO480/labs/policy-governance/ansible/wildcard.yml -e cert_path=$(pwd) -e "not_after=+3650d" -e update_cert=True -e combined_name=wildcard-combined

oc set data \
configmap/wildcard-bundle --from-file ca-bundle.crt=wildcard-combined.pem \
-n openshift-config

oc set data \
secret/wildcard-tls --from-file tls.crt=wildcard-combined.pem \
--from-file tls.key=wildcard-key.pem -n openshift-ingress

