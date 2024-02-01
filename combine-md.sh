#!/bin/bash

output_file="combined-documentation.md"
echo "# Combined Markdown Files" > "$output_file"

# Parcourir tous les fichiers MD et les ajouter au fichier de sortie
find . -name '*.md' ! -name "$output_file" | while read file; do
    echo -e "\n\n---\n## File: $file\n" >> "$output_file"
    cat "$file" >> "$output_file"
done

echo "All MD files have been combined into $output_file."
