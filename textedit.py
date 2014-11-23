#!/usr/bin/python
import sys,re
import subprocess

f = open('posts.txt', 'r')

re1='.*?'
re2='(\\d+)'

for line in f:
  rg = re.compile(re1+re2,re.IGNORECASE|re.DOTALL)
  m = rg.search(line)
  if m:
   int1=m.group(1)
   print int1
f.close()
