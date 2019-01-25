#!/bin/bash

source preapi.sh

if [[ "$1" == *\\* ]] || [[ "$3" == *\\* ]]; then
	hasPath=true
	if [[ "$1" == *\\* ]]; then par="$1"; else par="$3"; fi
	pth=$(cpath "$par")

	if [[ "$1" == *\\* ]]; then
		isFirstArgPath=true
	fi

	if [ ! -d "$pth" ]; then
		echo "Provided Windows path can't be converted!"
		exit 1
	fi
elif [[ -d "$1" || -d "$3" ]]; then
	# This has a weird behaviour
	# This is for Linux paths

	hasPath=true
	pth=`[[ -d "$1" ]] && echo "$1" || echo "$3"`

        if [[ -d "$1" ]]; then
                isFirstArgPath=true
        fi
fi

remote=$([ ! -z "$hasPath" ] && ([ ! -z "$isFirstArgPath" ] && echo "$3" || echo "$1") || echo "$1")
branch=$([ ! -z "$hasPath" ] && ([ ! -z "$isFirstArgPath" ] && echo "$4" || echo "$2") || echo "$2")

if [ -z "$remote" ]; then
        remote="origin"
fi

if [ -z "$branch" ]; then
        branch="master"
fi

# echo "Path: $pth"
# echo "Remote: $remote"
# echo "Branch: $branch"
