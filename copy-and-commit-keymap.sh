#!/bin/bash

# Copy content from copy to original
cp config/corny.keymap config/boards/shields/corny/corny.keymap

# Check if original file has been modified (staged or unstaged)
if git diff --cached --name-only | grep -q "config/boards/shields/corny/corny.keymap" || git diff --name-only | grep -q "config/boards/shields/corny/corny.keymap"; then
  # Add and commit original file (if changes exist)
  git add config/boards/shields/corny/corny.keymap
  latest_commit_sha=$(git rev-parse HEAD)
  # Use the SHA to access the message elsewhere in your script (if needed)
  last_commit_message=$(git log --format=%B -n 1 $latest_commit_sha)
  
  git commit -m "$last_commit_message: Updated config/boards/shields/corny/corny.keymap from config/corny.keymap changes."
  echo "Committed changes to config/boards/shields/corny/corny.keymap"
  git push
else
  echo "No changes detected in config/boards/shields/corny/corny.keymap. Skipping commit."
fi
