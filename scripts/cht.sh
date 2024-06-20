#!/bin/bash

function chtsh() {
	languages="javascript python ansible lua typescript"
	core_utils="find"

	selected=$(echo "$languages $core_utils" | tr " " "\n" | fzf)
	if [[ -z $selected ]]; then
	    exit 0
	fi

	read -p "Enter Query: " query

	if echo "$languages" | grep -qs "$selected"; then
	    query=$(echo $query | tr ' ' '+')
	    curl cht.sh/$selected/$query | less
	else
	    curl -s cht.sh/$selected~$query | less
	fi
}
