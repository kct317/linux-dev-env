##################################################################
# File Name:     /home/lzk0642/bin/pk.sh
# Author:        kct
# mail:          lzhkai1111@qq.com
# Created Time:  2017-08-02 14-47-14
# Last modified:	2017-08-02 14-47-14
##################################################################
#!/bin/bash

set -e

if [ $# != 1 ] ; then
    echo "word of process to be killed"
    exit 1
fi

echo $1
ps x|grep $1|grep -v grep |awk '{print $1}'|xargs kill -9
#ps x|grep $1|grep -v grep 
