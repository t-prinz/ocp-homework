#!/bin/bash
#
# Copy ssh key to hosts for Ansible access
#

LB=loadbalancer1.example.com
MASTERS="master1.example.com master2.example.com master3.example.com"
INFRA="infranode1.example.com infranode2.example.com infranode3.example.com"
NODES="node1.example.com node2.example.com node3.example.com node4.example.com node5.example.com node6.example.com"
NFS=oselab.example.com

for host in ${LB} ${MASTERS} ${INFRA} ${NODES} ${NFS}
do
  echo "configuring ${host}"
  ssh-copy-id ${host}
done
