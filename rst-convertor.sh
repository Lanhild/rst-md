#!/usr/bin/env bash

input_directory='./content'
output_directory='./content/converted_md'

# Create the output directory if it does not exist
mkdir -p "$output_directory"

find "$input_directory" -name '*.rst' | while read file; do
    # Get the parent directory path of the .rst file
    dir_path=$(dirname "${file}")
    
    # Remove the input directory prefix to obtain the subdirectory structure
    sub_dir="${dir_path#$input_directory}"
    
    # Create the same subdirectory in the output directory
    mkdir -p "$output_directory$sub_dir"
    
    # Extract the base name of the file for the output file name
    base_name=$(basename "${file%.rst}")
    
    # Set the output file name with the same subdirectory as the input file
    output_file="$output_directory$sub_dir/${base_name}.md"
    
    # Convert the .rst file to .md
    pandoc --from=rst --to=gfm --output="$output_file" "$file"
    
    echo "Converted: $file -> $output_file"
done

echo "Conversion completed!"