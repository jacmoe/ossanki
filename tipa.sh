#! /usr/bin/env bash
	curl -sS https://dictionaryapi.com/api/v3/references/collegiate/json/$1\?key=$WEBSTER_KEY\
	| json2tsv | awk '/[].hwi.prs[].mw/ {print $3; exit}' | tee webster.txt
