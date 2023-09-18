#!/bin/bash

# Define the input file
input_file="list.txt"

# Define the output file
output_file="oldFiles.txt"

# Initialize the output file (create or clear it)
> "$output_file"

# Loop through each line in the input file
while IFS= read -r line; do
  # Check if the line contains "jane" as a whole word (not followed by 'z')
  if [[ "$line" =~ .*[[:space:]]jane[^z[:alnum:]].* ]]; then
    # Append the line (filename) to the output file
    echo "$line" >> "$output_file"
  fi
done < "$input_file"

echo "Files containing 'jane' (but not 'janez') have been saved to $output_file."
