#!/bin/sh
set -xe
ENV="${1}"
echo "Changes prepared for the ${ENV} Envirnonment."
chmod +x bin/plan.sh
cd terraform
GIT_COMMIT_SHA=$(git rev-parse --verify HEAD)
terraform init -input=false -var-file=${ENV}.tfvars -backend-config="prefix=mgcp-1288677-4c-ng-${ENV}"
if [ "$GITHUB_BRANCH" = "master" ];
then
terraform plan -input=false -var-file=${ENV}.tfvars -out="terraform-$GIT_COMMIT_SHA.plan" -detailed-exitcode
else
terraform plan -input=false -var-file=${ENV}.tfvars -out="terraform-$GIT_COMMIT_SHA.plan"
fi
# for debugging, show the plan file exists
ls -la "terraform-$GIT_COMMIT_SHA.plan"
