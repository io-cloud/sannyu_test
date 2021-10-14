#!/bin/bash

read STR
ARR=(${STR//,/ })

for S in "${ARR[@]}";
do
echo "$S" > /dev/null ;

    if [ "$S" = 111 ] || [ "$S" = 222 ]; then
        echo "zorome: $S "

    elif [ "$S" = 333 ] || [ "$S" = 444 ]; then
        echo "zorome: $S "

    elif [ "$S" = 555 ] || [ "$S" = 666 ]; then
        echo "zorome: $S "

    elif [ "$S" = 777 ] || [ "$S" = 888 ]; then
        echo "zorome: $S "

    elif [ "$S" = 999 ] || [ "$S" = 000 ]; then
        echo "zorome: $S "

    elif [[ "$S" =~ [^0-9] ]]; then
        echo "umach patten: $S"

    elif [ $S -gt 1000 ] ||[ $S -lt 99 ]; then
        echo "umach patten: $S"

    else
        echo "$S"
    fi
done
