#!/bin/bash

ssh ${SSH_USER}@${HOST} 'mkdir -p ~/install_wlpfo'

echo "copy from nexus"

ssh ${SSH_USER}@${HOST} curl -X GET -u 'wlp-auth-wlpfo-nexus-download:HcnT57MivkKxDb9e' https://nexus.kazan.priv.atos.fr/repository/wlp-auth-wlpfo-nexus-releases/net/atos/wlp/auth/wlp-fo/post_install/5.12.0.24/post_install-5.12.0.24.zip -O

ssh ${SSH_USER}@${HOST} mv post_install-5.12.0.24.zip /home/${SSH_USER}/install_wlpfo/

