##################################################################
# File Name:     /home/users/kleung/.bin/clangf.sh
# Author:        kct
# mail:          lzhkai1111@qq.com
# Created Time:  2019-09-12 11-30-07
# Last modified:	2019-09-12 11-30-07
##################################################################
#!/bin/bash

if [[ $# -gt 1 ]]
then
    for arg in "$@" do
        clang-format-9 -style=file -i $arg
    done
else
    clang-format-9 -style=file -i `find . -type f -regex ".*\.\(cpp\|h\|hpp\|c\|objc\)"`
fi
