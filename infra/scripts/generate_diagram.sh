#!/bin/bash

set -e

# CONFIG
AWS_PROFILE="codeanding"
INFRA_DIR="./infra"
OUTPUT_DIR="./diagrams"
DOT_FILE="graph.dot"
OUTPUT_FILE="$OUTPUT_DIR/diagram.png"

echo "📁 Generating Terraform diagram from: $INFRA_DIR"

# Check if infra directory exists
if [ ! -d "$INFRA_DIR" ]; then
  echo "❌ Directory not found: $INFRA_DIR"
  exit 1
fi

# Move to infra directory
cd "$INFRA_DIR"

echo "🔧 Running terraform init (with reconfigure)..."
AWS_PROFILE=$AWS_PROFILE terraform init -reconfigure

echo "🧠 Generating Terraform graph..."
AWS_PROFILE=$AWS_PROFILE terraform graph > "$DOT_FILE"

echo "📦 Creating output folder: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

echo "🖼️ Converting DOT to PNG: $OUTPUT_FILE"
dot -Tpng "$DOT_FILE" -o "$OUTPUT_FILE"

# Cleanup
rm "$DOT_FILE"

echo "✅ Diagram created successfully at $OUTPUT_FILE"
