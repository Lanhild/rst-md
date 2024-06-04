#!/usr/bin/env bash

input_directory="./src/content"
output_directory="./dist"
exclusions_file="./scripts/exclusions.txt"
repo_url="${REPO_URL}"

# Read exclusions from file and remove the prefix
exclusions=()
while IFS= read -r line; do
    exclusions+=("${line#/}")
done < "$exclusions_file"

# Function to check if a file is in the exclusions list
is_excluded() {
    local file=$1
    local relative_file=${file#$input_directory/}
    echo "Checking: $relative_file"  # Debugging line
    for excluded in "${exclusions[@]}"; do
        if [[ "$relative_file" == "$excluded" ]]; then
            echo "Excluded: $relative_file"  # Debugging line
            return 0
        fi
    done
    return 1
}

# Display exclusions for debugging
echo "Exclusions:"
printf '%s\n' "${exclusions[@]}"

# Create the output directory if it does not exist
mkdir -p "$output_directory"

# Count the total number of files to calculate progress
total_files=$(find "$input_directory" -name '*.rst' | wc -l)
current_file=0
excluded_files=0

# Find and convert RST files to Markdown
find "$input_directory" -name '*.rst' | while read -r file; do
    # Check if the file is excluded
    if is_excluded "$file"; then
        echo "Excluded: $file"
        excluded_files=$((excluded_files + 1))
        continue
    fi

    # Increment the file counter
    current_file=$((current_file + 1))
    
    # Get the parent directory path of the .rst file
    dir_path=$(dirname "$file")
    
    # Remove the input directory prefix to obtain the subdirectory structure
    sub_dir="${dir_path#$input_directory}"
    
    # Create the same substructure in the output directory
    mkdir -p "$output_directory$sub_dir"
    
    # Extract the base name of the file for the output file name
    base_name=$(basename "${file%.rst}")
    
    # Set the output file name with the same substructure as the input file
    output_file="$output_directory$sub_dir/${base_name}.md"
    
    # Convert the .rst file to .md
    pandoc --from=rst --to=gfm "$file" -o "$output_file"
    
    # Commenting out the image link update section
    # Update image links to use direct URLs
    #grep -E '^\.\. image:: .*' "$file" | while read -r line; do
    #    img=$(echo "$line" | sed 's/^\.\. image:: //')
    #    img_url="$repo_url/$sub_dir/$img"
    #    # Update the image link in the Markdown file
    #    sed -i "s#<img src=\"$img\"#<img src=\"$img_url\"#g" "$output_file"
    #done
    
    # Calculate the progress percentage
    progress=$(( 100 * current_file / total_files ))
    
    echo "Converted: $progress% completed"

done

# Display the final count of converted and excluded files
echo "Conversion completed!"
echo "Total files: $total_files"
