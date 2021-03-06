
#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname ${0})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ${GOPATH}/src/k8s.io/code-generator)}

vendor/k8s.io/code-generator/generate-groups.sh all \
  gitlab.com/pickledrick/annotation-controller/src/pkg/client gitlab.com/pickledrick/annotation-controller/src/pkg/apis \
  example.com:v1 \
  --go-header-file ${SCRIPT_ROOT}/hack/custom-boilerplate.go.txt
