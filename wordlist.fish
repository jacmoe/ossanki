#! /usr/bin/fish
ls words | awk '!/^$/' | sed 's/.png//' | xargs -I {} dict -d gcide {} > words_processed.txt
