##################################################################
# File Name:     calc_code.sh
# Author:        kct
# mail:          lzhkai1111@qq.com
# Created Time:  2019-01-21 15-55-07
# Last modified:	2019-01-21 15-55-07
##################################################################
#!/bin/bash

set -e

if [ $# != 1 ] ; then
    echo "input path"
    exit 1
fi

find $1 -regex  ".*\.c\|.*\.cpp\|.*\.hpp\|.*\.h" | xargs cat | wc -l

