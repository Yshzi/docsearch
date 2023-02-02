#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 directory string"
  exit 1
fi

directory=$1
string=$2

count=0

for file in "$directory"/*; do
  if [ -f "$file" ]; then
    count=$((count + $(grep -c "$string" "$file")))
  fi
done

echo "Number of lines containing '$string': $count"
