#!/usr/bin/env bash

# Variables for directories
repo_url="https://github.com/odoo/documentation"
branch="16.0"
src_directory="./src"
input_directory="$src_directory/content"

# Delete the src directory if it exists to avoid conflicts
if [ -d "$src_directory" ]; then
    rm -rf "$src_directory"
fi

# Cloner le dépôt Odoo
git clone -b "$branch" "$repo_url" "$src_directory"

# Check if cloning was successful
if [ ! -d "$input_directory" ]; then
    echo "Error: Repository cloning failed or directory 'content' not found."
    exit 1
fi

echo "Repository cloning completed successfully."

# Export the repo_url for the conversion script
export REPO_URL="${repo_url}/blob/${branch}/content"
