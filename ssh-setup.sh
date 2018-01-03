#!/bin/bash
#
# From the bastion host as root
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
  subscription-manager register --force
  subscription-manager attach --pool=8a85f98c608ccb070160913e1c1a1cab
  subscription-manager repos --disable="*"
  yum-config-manager --disable \*
  subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-ose-3.7-rpms" \
    --enable="rhel-7-fast-datapath-rpms"
done
