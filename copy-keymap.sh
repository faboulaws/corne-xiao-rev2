#!/bin/bash

# Check if copy file has been modified
if git diff --cached --name-only | grep -q "config/corny.keymap"; then
  # Copy content from copy to original
  cp config/corny.keymap config/boards/shields/corny/corny.keymap
  # Add original file to staging area
  git add config/boards/shields/corny/corny.keymap
  echo "Updated config/boards/shields/corny/corny.keymap from config/corny.keymap changes."
fi
