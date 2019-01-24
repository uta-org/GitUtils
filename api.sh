#!/bin/bash

mypath=`dirname "$0"`

oIFS="$IFS"
IFS=$'\n'

dirs=($(find "$mypath" -maxdepth 1 -mindepth 1 -type d))

for dir in "${dirs[@]}"; do
        if [[ -d "$dir" && ! -L "$dir" ]]; then
           iterate_dirs "$dir" "$dir/.git"
        fi
done

IFS="$oIFS"
