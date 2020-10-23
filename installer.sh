#!/bin/bash

set -x

ssh ${SSH_USER}@${HOST} "mkdir -p ~/install_wlpfo"

echo "copy from nexus"

#ssh ${SSH_USER}@${HOST} curl -X GET -u 'wlp-auth-wlpfo-nexus-download:HcnT57MivkKxDb9e' ${NEXUS} -O

ssh ${SSH_USER}@${HOST} "cd ~/install_wlpfo; curl -X GET -u 'admin:admin123' ${NEXUS} -O"

#ssh ${SSH_USER}@${HOST} mv ${Nexus} /home/${SSH_USER}/install_wlpfo/

ssh ${SSH_USER}@${HOST} << 'EOF'

if [ -f ~/.install.source ]; then
  source ~/.install.source
fi

cd ~/install_wlpfo

PACKAGE=$(ls *.zip)
DIR=${PACKAGE/.zip/}

if [[ ! -e $DIR ]]; then
    #DIR=${PACKAGE/.zip/}
    mkdir $DIR
    mv $PACKAGE $DIR
    cd $DIR
    unzip $PACKAGE
elif [[ ! -d $DIR ]]; then
    echo "$DIR already exists"
    rm *.zip
fi

EOF


#d=`date +%Y%m%d`

#sed "s/TNS_ADMIN=\${HOME}/TNS_ADMIN=\/home\/wlpfo/g" *.properties




