oc login -u admin -p redhat \
	https://api.ocp4.example.com:6443

oc new-project open-cluster-management

oc patch installplan install-4k2q8 \
	--type merge --patch '{"spec":{"approved":true}}'

watch oc get csv

oc get managedcluster
