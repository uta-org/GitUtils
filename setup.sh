#!/bin/bash

function cpath() {
	arg="$1"
	drive=${arg:0:1}
	pth="/${drive,,}/${arg:3}"
	pth=${pth//\\//}

	if [ "${pth:-1}" != "/" ]; then
        	pth="$pth/"
	fi

	if [ -d "$pth" ]; then
		echo "$pth"
	else
		echo "/mnt$pth"
	fi
}

read -rp "Please, type/paste the working path (folder) you wish to link this scripts: " working_dir
working_dir=$(cpath "$working_dir")

files=($(find . -maxdepth 1 -not -type d))

for file in "${files[@]}"; do
	file=${file//.\//}

	if [[ "$file" != "setup.sh" ]] && [[ ! -f "$working_dir$file" ]]; then
		#   Source      Target
		ln "$file" "$working_dir$file"
	fi
done

read -rp "Do you want to create a \`git setup\` aliase? [yN]: " create_alias

shopt -s nocasematch
if [ "$create_alias" == "y" ]; then
	for file in "${files[@]}"; do
		file=${file//.\//}
		if [ "$file" != "setup.sh" ]; then
			git config --global alias.${file//.sh/} "!bash '$working_dir$file'"
		fi
	done
fi
