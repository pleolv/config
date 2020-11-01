#!/bin/bash

#curl -X GET -u 'deployment:passw0rd123' http://10.194.17.121:8081/repository/test-voyager-2/net/atos/voyager/voyager-config-${PKG}/${BUILD_ENV}-${VERSION}-${FINAL}/voyager-config-${PKG}-${BUILD_ENV}-${VERSION}-${FINAL}.tar.gz

curl -X GET -u 'admin:admin123' http://127.0.0.1:8081/repository/wlp-auth-wlpfo-nexus-release/net/atos/wlp/auth/wlp-fo/0.0.1/wlp-fo-0.0.1.zip -O
