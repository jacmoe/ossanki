#! /usr/bin/env bash
awk -v w=$1 ' w == tolower($2) {$1 = ""; print $0} ' ~/projects/cmudict-ipa/brown-frequency-list-with-ipa.txt |\
xargs -I {} echo $1 {} | tee result.txt
