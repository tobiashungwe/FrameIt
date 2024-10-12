#!/bin/bash
# setup-hooks.sh: Script to set up Git hooks for the repository

# Ensure we're in the root of the repository
if [ ! -d ".git" ]; then
    echo "This script must be run from the root of a Git repository"
    exit 1
fi

echo "Setting up Git hooks..."

# Set the custom hooks path to use the .githooks directory
git config core.hooksPath .githooks

# Check if the pre-push hook exists, and copy it if not already set up
if [ ! -f ".git/hooks/pre-push" ]; then
    cp .githooks/pre-push .git/hooks/pre-push
    chmod +x .git/hooks/pre-push
    echo "Pre-push hook installed."
else
    echo "Pre-push hook already exists."
fi

# Copy other hooks if needed (e.g., post-checkout)
if [ ! -f ".git/hooks/post-checkout" ]; then
    cp .githooks/post-checkout .git/hooks/post-checkout
    chmod +x .git/hooks/post-checkout
    echo "Post-checkout hook installed."
else
    echo "Post-checkout hook already exists."
fi

echo "Git hooks setup complete."
