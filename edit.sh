#!/bin/bash
for var
do
  echo Editing post $var
  # You need to fill in details in here:
  # EDIT post url with post ID, eg "http://www.somesite.com/forum/edit.post?do=updatepost&postid="
  # Replace all SOMESITE with your sites
  # Add your cookie information
  curl -k --raw -o $var.edit.dat -X POST \
    -d "do=updatepost&ajax=1&postid=$var&wysiwyg=0&message=delete&reason=" \
    "http://www.SOMESITE.com/forum/editpost.php?do=updatepost&postid=$var" \
    -H "Host: www.SOMESITE.com" \
    -H "Connection: keep-alive"\
    -H "Origin: http://www.SOMESITE.com" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: */*" \
    -H "Referer: http://www.SOMESITE.com" \
    -H "Accept-Encoding: gzip,deflate" \
    -H "Accept-Language: en-US,en;q=0.8,en-GB;q=0.6" \
    -H "Cookie: COOKIEINFORMATION"
  sleep 0.1
done
