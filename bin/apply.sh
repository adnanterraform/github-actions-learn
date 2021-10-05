#!/bin/sh
ENV="${1}"
echo "Changes to be appled to the ${ENV} Environment."
chmod +x bin/apply.sh
cd terraform
GIT_COMMIT_SHA=$(git rev-parse --verify HEAD)
echo $GIT_COMMIT_SHA
terraform init -input=false -var-file=${ENV}.tfvars -backend-config="prefix=mgcp-1288677-4c-ng-${ENV}"
terraform apply --auto-approve -input=false "$GITHUB_WORKSPACE/artifact/terraform-$GIT_COMMIT_SHA.plan"
