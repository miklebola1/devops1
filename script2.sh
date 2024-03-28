#!/bin/bash

cd myfolder

file_count=$(ls -1 | wc -l)

find . -type f -perm 0777 -exec chmod 664 {} \;

find . -type f -empty -delete

for file in *; do
  if [ -f "$file" ]; then
    sed -i '2,$d' "$file"
  fi
done
