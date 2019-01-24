#!/bin/bash

dirs=($(ls -1d */))
for dir in "${dirs[@]}"; do
        gitdir="$dir.git"

        # git --git-dir=$gitdir --work-tree=$dir add --ignore-removal --all
done
