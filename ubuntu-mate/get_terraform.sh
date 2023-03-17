#!/bin/bash


TERRAFORM_VERSION=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`

cd /tmp
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip  -d /usr/local/bin
rm /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip 

echo "################## Terraform v${TERRAFORM_VERSION} Installed ################"
