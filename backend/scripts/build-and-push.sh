#!/bin/bash

set -euo pipefail

# CONFIG
AWS_REGION="us-west-2"
AWS_PROFILE="codeanding"
PROJECT_NAME="tcg-demo"
REPO_NAME="${PROJECT_NAME}-backend"

# Get AWS Account ID using provided profile
ACCOUNT_ID=$(aws sts get-caller-identity --profile "$AWS_PROFILE" --query Account --output text)
ECR_URL="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPO_NAME}"

echo "🛠️ Building and pushing Docker image using AWS profile '$AWS_PROFILE'..."
echo "🔐 Logging in to ECR..."
aws ecr get-login-password --region "$AWS_REGION" --profile "$AWS_PROFILE" \
  | docker login --username AWS --password-stdin "$ECR_URL"

echo "🐳 Building Docker image..."
cd "$(dirname "$0")/.."
docker build -t "${REPO_NAME}:latest" .

echo "🏷️ Tagging image as ${ECR_URL}:latest..."
docker tag "${REPO_NAME}:latest" "${ECR_URL}:latest"

echo "📤 Pushing to ECR..."
docker push "${ECR_URL}:latest"

echo "✅ Done! Image pushed to: ${ECR_URL}:latest"
