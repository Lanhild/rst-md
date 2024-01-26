#!/usr/bin/env bash

input_directory='./content'
output_directory='./content/converted_md'

# Crée le répertoire de sortie s'il n'existe pas
mkdir -p "$output_directory"

find "$input_directory" -name '*.rst' | while read file; do
    # Obtient le chemin du répertoire parent du fichier .rst
    dir_path=$(dirname "${file}")
    
    # Retire le préfixe du chemin d'entrée pour obtenir la structure de sous-dossier
    sub_dir="${dir_path#$input_directory}"
    
    # Crée le même sous-répertoire dans le répertoire de sortie
    mkdir -p "$output_directory$sub_dir"
    
    # Extrait le nom de base du fichier pour le nom du fichier de sortie
    base_name=$(basename "${file%.rst}")
    
    # Définit le nom de fichier de sortie avec le même sous-dossier que le fichier d'entrée
    output_file="$output_directory$sub_dir/${base_name}.md"
    
    # Convertit le fichier .rst en .md
    pandoc --from=rst --to=gfm --output="$output_file" "$file"
    
    echo "Converti: $file -> $output_file"
done

echo "Conversion terminée!"