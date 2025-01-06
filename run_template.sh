#!/bin/bash

# Define the Helm chart directory (customize this)
CHART_DIR="./chart"
OUT_DIR="./out"

# Check if Helm chart directory exists
if [ ! -d "$CHART_DIR" ]; then
  echo "Error: Helm chart directory '$CHART_DIR' not found."
  exit 1
fi

helm_template() {
  echo "Running 'helm template' in directory '$CHART_DIR'..."
  helm template "$CHART_DIR" --output-dir "$OUT_DIR" 
}

helm_template