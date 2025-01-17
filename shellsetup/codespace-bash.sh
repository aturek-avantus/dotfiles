#!/bin/bash
set -euo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

err() {
    >&2 echo "Error: ${*}"
    exit 1
}

if [[ "$CODESPACES" != "true" ]] ; then
    err "Running codespace setup outside of a Github codespace"
fi

REPO_NAME=$(echo $GITHUB_REPOSITORY | cut -d '/' -f 2)
AWS_CONFIG_VAR_NAME="AWS_CONFIG_$(echo $REPO_NAME | tr '[:lower:]' '[:upper:]')"

echo "Looking for an AWS profile named $REPO_NAME. Also a config, if available, at $AWS_CONFIG_VAR_NAME"

AWS_CONFIG_ENCODED="${!AWS_CONFIG_VAR_NAME}"

if [[ "$AWS_CONFIG_ENCODED" != "" ]] ; then
    echo "Found data at $AWS_CONFIG_VAR_NAME. Appending it to ~/.aws/credentials"
    mkdir -p ~/.aws
    echo "$AWS_CONFIG_ENCODED" | base64 -d >> ~/.aws/credentials
fi

echo "Using AWS profile $REPO_NAME as default"
echo "export AWS_DEFAULT_PROFILE=\"$REPO_NAME\"" >> ~/.bashrc

echo "Copying over dotfiles from $SCRIPT_DIR to $HOME"

for file in .bashrc .gitconfig .gitignore .vimrc .git-completion.bash ; do
    cat $SCRIPT_DIR/../$file >> ~/$file
done
