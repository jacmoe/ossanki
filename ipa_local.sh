#! /usr/bin/env bash
# Script uses IPA database downloaded from https://github.com/menelik3/cmudict-ipa
awk -v w=$1 ' w == tolower($1) {print $2} ' ~/projects/cmudict-ipa/cmudict-0.7b-ipa.txt |\
xargs -I {} echo $1 {} | tee result.txt
