#!/bin/bash

set -x

sshpass -p ${PASSWORD} ssh -o "StrictHostKeyChecking no" ${USER}@${HOST} "echo export AWSKEY=${aws_access_key_id}" >> ~/.bashrc
sshpass -p ${PASSWORD} ssh -o "StrictHostKeyChecking no" ${USER}@${HOST} "echo export AWSSECRETKEY=${aws_secret_access_key}" >> ~/.bashrc
sshpass -p ${PASSWORD} ssh -o "StrictHostKeyChecking no" ${USER}@${HOST} "echo export REGION=us-east-2 > ~/.bashrc

sshpass -p ${PASSWORD} ssh -o "StrictHostKeyChecking no" ${USER}@${HOST} << EOF

OCP_VERSION=4.4.3
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-install-linux-${OCP_VERSION}.tar.gz
tar zxvf openshift-install-linux-${OCP_VERSION}.tar.gz -C /usr/bin
rm -f openshift-install-linux-${OCP_VERSION}.tar.gz /usr/bin/README.md
chmod +x /usr/bin/openshift-install

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-client-linux-${OCP_VERSION}.tar.gz
tar zxvf openshift-client-linux-${OCP_VERSION}.tar.gz -C /usr/bin
rm -f openshift-client-linux-${OCP_VERSION}.tar.gz /usr/bin/README.md
chmod +x /usr/bin/oc

ls -l /usr/bin/{oc,openshift-install}

oc completion bash >/etc/bash_completion.d/openshift

mkdir $HOME/.aws
cat << EOF >>  $HOME/.aws/credentials
[default]
aws_access_key_id = ${AWSKEY}
aws_secret_access_key = ${AWSSECRETKEY}
region = $REGION
EOF




EOF
