#! /usr/bin/fish
ls words2 | awk '!/^$/' | sed 's/.png//' > words2.txt

awk '
    FNR == NR {
      # reading file1
      words[$1] = ""
      next
    }
    {
      # reading file2
      for (elem in words)
        if (tolower($2) == elem)
          if (values[elem] == "")
            values[elem] = substr($3, 2)
          else
            values[elem] = values[elem] substr($3, 2)
    }
    END {
      for (elem in values)
        print elem, values[elem]
    }
' ./words2.txt ~/projects/cmudict-ipa/brown-frequency-list-with-ipa.txt | tee words2_processed.txt
