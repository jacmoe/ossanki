#! /usr/bin/fish
ls words2 | awk '!/^$/' | sed 's/.png//' > words2.txt

awk '
    FNR == NR {
      # reading file1
      words[$0] = $0
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
        if (not tolower($2) == values[elem])
            values[elem] = elem " ***NOT FOUND***"
    }
    END {
      for (elem in values)
        print values[elem]
    }
' ./words2.txt ~/projects/cmudict-ipa/brown-frequency-list-with-ipa.txt | tee words2_processed.txt
