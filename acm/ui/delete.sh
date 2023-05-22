oc login -u admin -p redhat https://api.ocp4.example.com:6443
oc delete project open-cluster-management
oc delete clusterrole klusterlet
oc delete clusterrolebinding klusterlet
oc login -u admin -p redhat https://api.ocp4-mng.example.com:6443
oc delete clusterrole klusterlet
oc delete clusterrole open-cluster-management:klusterlet-admin-aggregate-clusterrole
oc delete clusterrolebinding klusterlet
