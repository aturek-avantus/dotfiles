#!/bin/bash
set -euxo pipefail

if [[ "$CODESPACES" == "true" ]] ; then
    source shellsetup/codespace-bash.sh
    exit 0
fi
