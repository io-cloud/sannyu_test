#!/bin/bash

function help {
    cat <<- EOF
    overview：backup or restore
    usage：bak.sh [-h|-b|-r] filename ...
    option：
      -h  this message
      -b  backup
      -r  restore
EOF
    exit 1
}

while getopts brh OPT
do
    case $OPT in
        b)
          IS_RESTORE=0
            ;;
        r)
          IS_RESTORE=1
            ;;
        h)
          help
            ;;
    esac
done

shift $((OPTIND - 1))

for file in $*
do
    if [ "$IS_RESTORE" -eq 1 ]; then
        if [ ! -e "${file}.bak" ]; then
            echo "ERROR: A file doesn't exist. ${file}.bak"
            continue
        fi
        SRC=${file}.bak
        DST=${file}
    else
        if [ ! -e "${file}" ]; then
            echo "ERROR: A file doesn't exist. ${file}"
            continue
        fi
        SRC=${file}
        DST=${file}.bak
    fi
    echo -n "$SRC --> $DST  ...  "
    cp $SRC $DST &> /dev/null
    if [ "$?" -eq 0 ]

    then
        echo "OK"
    else
        echo "ERROR: It can't be copied."
    fi
done
