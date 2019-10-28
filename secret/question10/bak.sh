#!/bin/bash
 
function help {
    cat <<- EOF
    overview：backup or restore
    usage：bak.sh [-h|-b|-r] filename ...
    option：
      -h  this message
      -b  backup
      #hoge.log --> hoge.log.bak
      -r  restore
      #hoge.log <-- hoge.log.bak
EOF
    exit 1
}

while getopts ":brh" OPT;

do
    case ${OPT} in
        b)
          opt="backup";
            ;;
        r) 
          opt="restore";
            ;;
        h)
          help
            ;;
        *)
          echo echo "option is unexpected. [getopts]"
    esac
done

shift $((OPTIND - 1))


for file in `ls tmp/ | grep -v ".bak"`
do
    file=tmp/${file}
    if [ "$opt" = "restore" ]; then
        if [ ! -e "${file}.bak" ]; then
            echo "ERROR: A file doesn't exist. ${file}.bak"
            continue
        fi
        #hoge.log <-- hoge.log.bak
        SRC=${file}.bak
        DST=${file}
        #SRC=${file}
        #DST=${file}.bak
    elif [ "$opt" = "backup" ]; then
        if [ ! -e "${file}" ]; then
            echo "ERROR: A file doesn't exist. ${file}"
            continue
        fi
        #hoge.log --> hoge.log.bak
        SRC=${file}
        DST=${file}.bak
        #SRC=${file}.bak
        #DST=${file}
    else
        echo "option is unexpected."
        help
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