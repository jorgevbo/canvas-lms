#!/bin/bash
packer build -var-file=terraform_vars.json -var-file=packer_vars.json canvas-init.json

# Generar archivo de variables con el ID de la AMI para terraform
artifact_id=`jq ".builds[0].artifact_id" init-manifest.json`
chars=${#artifact_id}
artifact_id=${artifact_id:1:$(($chars-2))}
IFS=':'
read -ra PACKER <<< "$artifact_id"

ami_string="variable \"packer_ami_id\" { default = \"${PACKER[1]}\" }"
region_string="variable \"packer_region\" { default = \"${PACKER[0]}\" }"
echo -e "$ami_string\n$region_string" > ../vm-creation/packer_variables.tf