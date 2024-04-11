#!/bin/bash

# Check if copy file has been modified
if git diff --cached --name-only | grep -q "copy.txt"; then
  # Copy content from copy to original
  cp copy.txt original.txt
  # Add original file to staging area
  git add original.txt
  echo "Updated original.txt from copy.txt changes."
fi
