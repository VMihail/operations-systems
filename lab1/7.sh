#bin/bash
email="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+"
grep -E -r -o -h "$email" /etc/ | awk '{printf("%s\n", $1)}' > emails.lst
