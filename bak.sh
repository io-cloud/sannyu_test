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
### Exam.10-1 MOD ###
# 本来であれば-r(リストア)の際に、バックアップファイルからのリストアを
# 行うべき、であれば本if文の条件判定は-rが指定されたかどうかであるはずだが、
# ここでは-bが指定されたかどうかを判定してしまっていたため、修正
# 本格的なリファクタリングを加えるのであれば、挙動が真逆のバックアップ処理とリストア処理は
# 関数化し分割しておけば、IS_RESTOREフラグの混乱などが起きにくくなり、
# このようなバグは起きにくくなると思われる
    if [ "$IS_RESTORE" -eq 1 ]; then
### END ###
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
