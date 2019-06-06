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

IS_REQUIRED=false

while getopts :brh OPT
do
    case $OPT in
        b)
          IS_RESTORE=0
          IS_REQUIRED=true
            ;;
        r) 
          IS_RESTORE=1
          IS_REQUIRED=true
            ;;
        h)
          help
            ;;
    esac
done

if [ $IS_REQUIRED == false ]; then
    echo "第一引数に、-b, -r, -h 以外が指定された、または何も指定されていないため、処理を中止します。"
    exit 1
fi

for ((i=2; i<=$#; i++))
do
    eval CHK_OPT='$'$i
    if [ $CHK_OPT == "-b" -o $CHK_OPT == "-r" ]; then
        echo "引数に、-b, -r が2回以上、または同時に指定されたため、処理を中止します。"
        exit 1
    fi
done

shift $((OPTIND - 1))
if [ -z $* ]; then
    echo "ファイル名が指定されていないため、処理を中止します。"
    exit 1
fi

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
