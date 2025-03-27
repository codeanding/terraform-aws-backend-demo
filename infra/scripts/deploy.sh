#!/bin/bash

set -e

# ========================
# CONFIG
# ========================
AWS_PROFILE="codeanding"
AWS_REGION="us-west-2"
APP_PORT=3000
TFVARS_FILE="terraform.tfvars"

echo "🚀 Starting Terraform deploy using AWS profile '$AWS_PROFILE'..."

cd infra

# ========================
# INIT (uses backend.tf)
# ========================
echo "🔧 Running terraform init (reconfigure)..."
AWS_PROFILE=$AWS_PROFILE terraform init -reconfigure

# ========================
# PLAN
# ========================
echo "📋 Running terraform plan..."
AWS_PROFILE=$AWS_PROFILE terraform plan \
  -var-file="$TFVARS_FILE" \
  -var="app_port=$APP_PORT" \
  -input=false

echo "⚠️  Review the plan above. Press Enter to apply or Ctrl+C to cancel."
read -p "⏸️ Waiting for confirmation..."

# ========================
# APPLY
# ========================
echo "🏗️  Applying Terraform..."
AWS_PROFILE=$AWS_PROFILE terraform apply \
  -var-file="$TFVARS_FILE" \
  -var="app_port=$APP_PORT"

echo "✅ Infrastructure deployed successfully."
