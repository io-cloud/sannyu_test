#!/bin/bash
IFS=','
hoge='123,abc,3333,555,321'
for i in $hoge; do
  if echo "$i" | grep -E "^([0-9])\1{2}$" >/dev/null 2>&1; then
        echo "zorome: $i"
  elif [[ $i =~ ^[0-9]{3}$ ]]; then
        echo "$i"
  else
        echo "unmatch pattern: $i"
  fi
done
