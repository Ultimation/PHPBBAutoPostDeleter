#!/bin/bash
# Insert your information where there are capital letters.
for i in `seq 1 19`; do
  echo iteration $i
  rm search.html posts.txt posts2.txt 
  curl -k -o search.html.gz \
    "http://www.SOMESITE.com/forum/search.php?searchid=$1&page=$i" \
    -H "Host: www.SOMESITE.com" \
    -H "Connection: keep-alive" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36" \
    -H "Referer: http://www.SOMESITE.com" \
    -H "Accept-Encoding: gzip" \
    -H "Accept-Language: en-US,en;q=0.8,en-GB;q=0.6" \
    -H "Cookie: COOKIEINFORMATION"
  gunzip search.html.gz
  dos2unix search.html
  grep showthread.php?p= search.html > posts.txt
  ./textedit.py > posts2.txt
  vars=$(cat posts2.txt)
  cat posts2.txt
  ./edit.sh $vars
  ./delete.sh $vars
  mv *.dat dats/
done
