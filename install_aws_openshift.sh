#!/bin/bash

set -x

sshpass -p ${PASSWORD} ssh ${USER}@${HOST} << EOF


ls -la


EOF
