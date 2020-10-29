#!/bin/bash

sshpass -p ${PASSWORD} ssh ${USER}@${HOST} << EOF


ls -la


EOF
