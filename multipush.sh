#!/bin/bash

bash "`dirname \"$0\"`/linking.sh" "$1" "$2" "$3"

git config --global credential.helper store

function iterate_dirs()
{
	dir="$1"
	gitdir="$2"

	git --git-dir="$gitdir" --work-tree="$dir" add --ignore-removal --all

	while [ -z "$commit_msg" ]; do
		read -p "(`basename $dir`) Enter message commit: " commit_msg
	done

	git --git-dir="$gitdir" --work-tree="$dir" commit -m "$commit_msg"
	git --git-dir="$gitdir" --work-tree="$dir" push -u "$remote" "$branch"

	clear
}

source api.sh
