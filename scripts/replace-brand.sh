#!/bin/bash

# Variables values to query
SEARCH1="Odoo"
SEARCH2="Odoo Community"
REPLACE="Konvergo ERP"
DIRECTORY="./dist"
EXCLUDE_DIR="--exclude-dir=node_modules"
SCRIPT_NAME=$(basename "$0")

countFiles=0
countReplaced=0
countSearch1=0
countSearch2=0
countFailed=0

# Search for files corresponding to the base queries 
FILES=$(grep -Rl $EXCLUDE_DIR -E "$SEARCH1|$SEARCH2" $DIRECTORY)

# Loop through list
for FILE in $FILES
do
  if [[ $(basename "$FILE") == "$SCRIPT_NAME" ]]; then
    continue
  fi
  
  echo "--------------------------------------------------------------------------------"
  echo "Analyzing $FILE"
  let countFiles++
  
  if grep -q -E "$SEARCH1|$SEARCH2" "$FILE"; then
    grep -q "$SEARCH1" "$FILE" && let countSearch1++
    grep -q "$SEARCH2" "$FILE" && let countSearch2++
    
    # String replacement
    if sed -i "" "s|$SEARCH1|$REPLACE|g; s|$SEARCH2|$REPLACE|g" "$FILE"; then
      echo "Replaced string in $FILE"
      let countReplaced++
    else
      echo "Replacement failed $FILE"
      let countFailed++
    fi
  fi
done

echo "--------------------------------------------------------------------------------"
echo "Summary:"
echo "Files analyzed: $countFiles"
echo "Files modified: $countReplaced"
echo "Strings '$SEARCH1' replaced: $countSearch1"
echo "Strings '$SEARCH2' replaced: $countSearch2"
echo "Failed replacements: $countFailed"
