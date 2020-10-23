#!/bin/bash

ssh ${SSH_USER}@${HOST} "mkdir -p ~/install_wlpfo"

echo "copy from nexus"

#ssh ${SSH_USER}@${HOST} curl -X GET -u 'wlp-auth-wlpfo-nexus-download:HcnT57MivkKxDb9e' ${Nexus} -O

ssh ${SSH_USER}@${HOST} "cd ~/install_wlpfo; curl -X GET -u 'admin:admin123' ${Nexus} -O"

#ssh ${SSH_USER}@${HOST} mv ${Nexus} /home/${SSH_USER}/install_wlpfo/

ssh ${SSH_USER}@${HOST} << 'EOF'

if [ -f ~/.install.source ]; then
  source ~/.install.source
fi

cd ~/install_wlpfo
PACKAGE=$(ls *.zip)
DIR=${PACKAGE/.zip/}

mkdir $DIR
mv $PACKAGE $DIR
cd $DIR

unzip $PACKAGE
#chmod u+x *.sh

EOF
