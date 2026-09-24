#!/usr/bin/env bash

source_id=$(pactl list short sources | grep "$(pactl get-default-source)" | awk '{print $1}')
if [[ -z "$source_id" ]]; then
    echo "No running source found."
    exit 1
fi
source_name=$(pactl list sources | awk -v id="$source_id" 'BEGIN { RS="" } $0 ~ "Source #"id"\n" { print $0 }' | grep "Description:" | sed 's/^\s*Description: //')

echo "$source_name"
