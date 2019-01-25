#!/bin/bash

bash "`dirname \"$0\"`/linking.sh" "$1" "$2" "$3"

function iterate_dirs()
{
	dir="$1"
	gitdir="$2"

	# git --git-dir="$gitdir" --work-tree="$dir" add --ignore-removal --all

	# echo "$dir"
	url=$(git --git-dir="$gitdir" --work-tree="$dir" config --get remote.$remote.url)
	rm -rf "$dir"
	git --git-dir="$gitdir" --work-tree="$dir" clone "$url"
}

source api.sh
