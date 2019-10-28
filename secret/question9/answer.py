#!/usr/bin/python

import sys
import re

# python answer.py 123,abc,3333,555,321

def main(thgs):
    redict = {
        "num3": re.compile(r'^[0-9]{3}$'),
    }
    for thg in thgs:
        find_flag = False
        for i in range(10):
            redict.update({
                "doublet3": re.compile(r'^[' + re.escape(str(i)) +']{3}$')
            })
            if redict["doublet3"].search(thg):
                print("zorome: {thg}".format(thg=thg))
                find_flag = True
                break
            else:
                redict["doublet3"] = None
                continue

        if find_flag:
            pass
        elif not find_flag and redict["num3"].search(thg):
            print("unmach pattern: {thg}".format(thg=thg))
        elif not find_flag:
            print(thg)
        else:
            raise Exception("Program Not Working! thg: {thg}".format(thg=thg))

if __name__ == '__main__':
    del sys.argv[0]
    targets = sys.argv[0].split(",")
    main(targets)