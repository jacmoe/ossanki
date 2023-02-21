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
          if (values[elem] == "") {
            $1 = ""
            values[elem] = tolower($0)
          }
          else
            values[elem] = tolower($0)
        if (tolower($2) != elem)
            values[elem] = elem " ***NOT FOUND***"
    }
    END {
      for (elem in values)
        print values[elem]
    }
' ./words2.txt ~/projects/cmudict-ipa/brown-frequency-list-with-ipa.txt | sed 's/^ //g' | tee words2_processed.txt
