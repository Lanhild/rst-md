#!/usr/bin/env bash

input_directory="./src/content"
output_directory="./dist"
exclusions_file="./scripts/exclusions.txt"
repo_url="${REPO_URL}" # This variable is set in the clone-repo.sh script

# Read exclusions from file and remove the prefix
exclusions=()
while IFS= read -r line; do
    exclusions+=("${line#/}")
done < "$exclusions_file"

# Function to check if a file is in the exclusions list
is_excluded() {
    local file=$1
    local relative_file=${file#$input_directory/}
    for excluded in "${exclusions[@]}"; do
        if [[ "$relative_file" == "$excluded" ]]; then
            return 0
        fi
    done
    return 1
}

# Display exclusions for debugging
echo "Exclusions:"
printf '%s\n' "${exclusions[@]}"

# Remove the output directory if it exists to avoid conflicts
if [ -d "$output_directory" ]; then
    rm -rf "$output_directory"
fi

# Create the output directory
mkdir -p "$output_directory"

# Count the total number of files to calculate progress
total_files=$(find "$input_directory" -name '*.rst' | wc -l)
current_file=0
excluded_files=0

# Function to convert RST to Markdown and copy images
convert_file() {
    local file=$1
    local dir_path=$(dirname "$file")
    local sub_dir="${dir_path#$input_directory}"
    local base_name=$(basename "${file%.rst}")
    local output_file="$output_directory$sub_dir/${base_name}.md"

    # Create the same substructure in the output directory
    mkdir -p "$output_directory$sub_dir"

    # Convert the .rst file to .md
    pandoc --from=rst --to=gfm "$file" -o "$output_file"

    # Copy images referenced in the RST file to the output directory
    grep -E '^\.\. image:: .*' "$file" | while read -r line; do
        img=$(echo "$line" | sed 's/^\.\. image:: //')
        img_source="$dir_path/$img"
        img_dest="$output_directory$sub_dir/$img"
        mkdir -p "$(dirname "$img_dest")"
        cp "$img_source" "$img_dest"
    done
}

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
    
    # Convert the file
    convert_file "$file"

    # Calculate the progress percentage
    progress=$(( 100 * current_file / total_files ))
    
    echo "Converted: $progress% completed"

done

# Display the final count of converted and excluded files
echo "Conversion completed!"
echo "Total files: $total_files"
echo "Files converted: $current_file/$total_files"
echo "Files excluded: $excluded_files"
