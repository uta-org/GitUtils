#!/bin/bash

remote=$1
branch=$2

if [ -z "$remote" ]; then
	remote="origin"
fi

if [ -z "$branch" ]; then
	branch="master"
fi

git config --global credential.helper store

mypath=`dirname "$0"`

oIFS="$IFS"
IFS=$'\n'

dirs=($(find "$mypath" -maxdepth 1 -mindepth 1 -type d))

for dir in "${dirs[@]}"; do
	if [[ -d "$dir" && ! -L "$dir" ]]; then
		gitdir="$dir/.git"

		git --git-dir="$gitdir" --work-tree="$dir" add --ignore-removal --all

		while [ -z "$commit_msg" ]; do
			read -p "Enter message commit: " commit_msg
		done

		git --git-dir="$gitdir" --work-tree="$dir" commit -m "$commit_msg"
		git --git-dir="$gitdir" --work-tree="$dir" push -u "$remote" "$branch"
	fi
done

IFS="$oIFS"
