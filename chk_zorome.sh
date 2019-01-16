#!/bin/bash

VAR=`echo $1 | tr ',' '\n'`
for i in $VAR ;do
                if echo "$i" | grep -E "([0-9])\1{2}" > /dev/null ; then
                        echo "zorome:$i"
                elif [[ "$i" =~ [0-9]{3} ]]; then
                        echo "$i"
                else
                        echo "unmatch pattern:$i"

                fi
done
