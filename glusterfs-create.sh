#!/bin/bash
#VAR
GLUSTER_DIR="/webpub/www/glusterfs"
GLUSTER_NODE_1="kube-test-1"
GLUSTER_NODE_2="kube-test-2"
GLUSTER_VOLUME="gv0"


#Create dir
mkdir $GLUSTER_DIR
#Connect from node1 to node2
gluster peer probe $GLUSTER_NODE_2
echo "Don't forget to peer this node from another"
#create volume on both nodes
gluster volume create $GLUSTER_VOLUME replica 2 $GLUSTER_NODE_1:$GLUSTER_DIR $GLUSTER_NODE_2:$GLUSTER_DIR force
#start volume
gluster volume start $GLUSTER_VOLUME


#Create endpoint and service in k8s
kubectl create -f glusterfs/endpoints.json
kubectl create -f glusterfs/service.json

echo "
To use  this volume add to pod/deployment:
===========================
spec:
  containers:
    volumeMounts:
    - mountPath: "/path/to/mount/dir/in/container"
      name: glusterfsvol
  volumes:
  - name: glusterfsvol
    glusterfs:
      endpoints: glusterfs-cluster
      path: $GLUSTER_VOLUME
      readOnly: false
"

