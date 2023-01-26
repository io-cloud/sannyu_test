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
    # 問10.指定された引数でなければ強制的に処理を終了 
    if [ "$IS_RESTORE" -ne 0 ] && [ "$IS_RESTORE" -ne 1 ] ; then
        exit
    ##

    ## 問10.誤っている部分の修正(40行目の値を0→1に変更)
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