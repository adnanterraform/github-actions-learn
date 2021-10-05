#!/bin/sh
set -xe
ENV="${1}"
echo "You are working on the ${ENV} Envirnonment."
brew install tfenv
tfenv install
chmod +x bin/lint.sh
cd terraform
LINT_OUTPUT=$(terraform fmt -check=true -write=false -diff=false -list=true)
LINT_RETURN="$?"
if [ $LINT_RETURN -ne 0 ]
then
echo "Linting failed, please run terraform fmt"
exit 1
else
echo "Linting success"
fi
