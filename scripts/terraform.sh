#!/usr/bin/env bash

#Debug mode enabled 
#set -x

#install jq if not installed 
which jq || {
  apt-get update
  apt-get install -y jq
} 


##### Install the latest version of terraform #####
# [ -f "/usr/local/bin/terraform" ] || {
#   pushd /usr/local/bin
#   TERRAFORM_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep 'terraform_[0-9]\.[0-9]{1,2}\.[0-9]{1,2}_linux.*amd64' | sort -V | tail -1)
#   curl -o terraform.zip ${TERRAFORM_URL}
#   unzip terraform.zip
#   rm -f terraform.zip
#   popd
# }

##### Install specific version of Terraform #####

# Desired Version -> format x.y.z
VERSION="0.12.29"

[ -f "/usr/local/bin/terraform" ] || {
  pushd /usr/local/bin
  TERRAFORM_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | egrep 'terraform_[0-9]\.[0-9]{1,2}\.[0-9]{1,2}_linux.*amd64' | sort -V | grep ${VERSION})
  curl -o terraform.zip ${TERRAFORM_URL}
  unzip terraform.zip
  rm -f terraform.zip
  popd
}