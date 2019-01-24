#!/bin/bash

remote=$1
branch=$2

if [ -z "$remote" ]; then
        remote="origin"
fi

if [ -z "$branch" ]; then
        branch="master"
fi
