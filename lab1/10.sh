#!bin/bash
man bash | grep -o "[a-zA-z]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -nr | head -3
