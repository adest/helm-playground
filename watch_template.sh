#!/bin/bash

source ./run_template.sh

# Function to watch files with inotifywait (Linux)
watch_with_inotify() {
  echo "Using inotifywait (Linux) to watch files..."
  while inotifywait -e modify -r "$CHART_DIR"; do
   helm_template 
  done
}

# Function to watch files with fswatch (macOS)
watch_with_fswatch() {
  echo "Using fswatch (macOS) to watch files..."
  fswatch -o "$CHART_DIR" | while read -r change; do
    helm_template
  done
}

# Detect the operating system and run the appropriate watcher
if command -v inotifywait >/dev/null 2>&1; then
  watch_with_inotify
elif command -v fswatch >/dev/null 2>&1; then
  watch_with_fswatch
else
  echo "Error: Neither 'inotifywait' nor 'fswatch' is installed."
  echo "Install inotifywait (Linux) or fswatch (macOS) to proceed."
  exit 1
fi