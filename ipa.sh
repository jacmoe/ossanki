#! /usr/bin/env bash
	curl https://dictionaryapi.com/api/v3/references/collegiate/json/$1\?key=$WEBSTER_KEY\
	| jq . | awk '/mw/ { gsub("\"", ""); gsub(",", ""); sub(/^./, "", $2); print $2; exit}'\
	| xargs -I {} echo $1 {} | tee $1.txt
