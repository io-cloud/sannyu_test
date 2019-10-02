#! /bin/bash
str=$1

if test -z "`echo $str | grep -E '^[0-9]{3}$'`" ; then
  echo "unmach pattern: ${str}"
else
  if test "${str:0:1}" = "${str:1:1}" -a "${str:1:1} = "${str:2:1} ; then
    echo "zorome: ${str}"
  else
    echo ${str}
  fi
fi
