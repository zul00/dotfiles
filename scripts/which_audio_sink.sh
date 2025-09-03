#!/usr/bin/env bash

sink_id=$(pactl list short sinks | grep "$(pactl get-default-sink)" | awk '{print $1}')
 if [[ -z "$sink_id" ]]; then
        echo "No running sink found."
        return 1
    fi
sink_name=$(pactl list sinks | awk -v id="$sink_id" 'BEGIN { RS="" } $0 ~ "Sink #"id"\n" { print $0 }' | grep "Description:" | sed 's/^\s*Description: //')

echo "$sink_name"
