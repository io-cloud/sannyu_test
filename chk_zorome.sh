#! /bin/bash

str=$1
if test -p /dev/stdin ; then
	str=`cat /dev/stdin`
fi

if test -n `echo $str | grep -E ','` ; then
	strs=`echo $str | sed -e 's/,/\n/g'`
else
	strs=`echo $str | sed -e 's/ /\n/g'`
fi

for str in `echo $strs` ; do
	if test -z "`echo $str | grep -E '^[0-9]{3}$'`" ; then
	  echo "unmach pattern: ${str}"
	else
	  if test "${str:0:1}" = "${str:1:1}" -a "${str:1:1} = "${str:2:1} ; then
	    echo "zorome: ${str}"
	  else
	    echo ${str}
	  fi
	fi
done
