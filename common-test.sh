#!/bin/bash
source ./common.sh



FILES_TO_DELETE=$(find $SOURCR_DIR -name "*.log" -mtime +14)
echo "Files to be deleted:: $FILES_TO_DELETE"

while read -r filepath
do 
    echo "Deleting files:: $filepath"
    rm -rf $filepath
done <<< $FILES_TO_DELETE