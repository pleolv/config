#!/bin/bash

ssh ${SSH_USER}@${HOST} << 'EOF'

mkdir -p ~/install_wlpfo

echo "copy from nexus"

#ssh ${SSH_USER}@${HOST} curl -X GET -u 'wlp-auth-wlpfo-nexus-download:HcnT57MivkKxDb9e' ${Nexus} -O

cd ~/install_wlpfo; curl -X GET -u 'admin:admin123' ${Nexus} -O

EOF

#ssh ${SSH_USER}@${HOST} mv ${Nexus} /home/${SSH_USER}/install_wlpfo/

