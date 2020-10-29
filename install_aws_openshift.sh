#!/bin/bash

set -x

sshpass -p ${PASSWORD} ssh -o "StrictHostKeyChecking no" ${USER}@${HOST} << EOF


ls -la


EOF
