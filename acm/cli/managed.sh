oc new-project managed-cluster
oc label namespace managed-cluster cluster.open-cluster-management.io/managedCluster=managed-cluster

oc create -f mngcluster.yaml
oc create -f klusterlet.yaml
oc get secret managed-cluster-import \
-n managed-cluster -o jsonpath={.data.crds\\.yaml} | base64 \
--decode > klusterlet-crd.yaml

oc get secret managed-cluster-import \
-n managed-cluster -o jsonpath={.data.import\\.yaml} | base64 \
--decode > import.yaml

oc login -u admin -p redhat \
https://api.ocp4-mng.example.com:6443

oc create -f klusterlet-crd.yaml
oc create -f import.yaml

