#!/bin/bash

set -e

# CONFIG
AWS_PROFILE="codeanding"
AWS_REGION="us-west-2"
APP_PORT=3000
TFVARS_FILE="terraform.tfvars"

echo "🚀 Starting Terraform deploy using AWS profile '$AWS_PROFILE'..."

cd infra

echo "🔧 Running terraform init..."
AWS_PROFILE=$AWS_PROFILE terraform init

echo "🏗️  Applying Terraform..."
AWS_PROFILE=$AWS_PROFILE terraform destroy \
  -var-file="$TFVARS_FILE" \
  -var="app_port=$APP_PORT"

echo "✅ Infrastructure destroyed successfully."

