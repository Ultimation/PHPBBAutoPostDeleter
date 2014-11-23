#!/bin/bash
# Put your details in here:
# You need your editpost.php URL eg "http://www.somesite.com/forum/editpost.php
# Your referer URL eg "http://www.somesite.com/forum/index.php"
# Your host URL eg "http://www.somesite.com"
# and your Cookie information (Password, identity, stuff like that - get it from a session to make it easy)

for var
  do
    echo deleting post $var 
    curl -k -i --raw -o $var.delete.dat -X POST \
    -d "do=deletepost&s=&postid=$var&deletepost=delete&reason=" \
    "EDITPOSTURL" \
    -H "Accept: text/html, application/xhtml+xml, */*" \
    -H "Referer: REFERERURL" \
    -H "Accept-Language: en-GB,en;q=0.5" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept-Encoding: gzip, deflate" \
    -H "Connection: Keep-Alive" \
    -H "DNT: 1" \
    -H "Host: HOSTURL" \
    -H "Pragma: no-cache" \
    -H "Cookie: COOKIEINFORMATION"
    # sleep not to spam the server and be detected
    sleep 0.1
  done
