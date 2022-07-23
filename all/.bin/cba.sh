##################################################################
# File Name:     .bin/cba.sh
# Author:        kct
# mail:          lzhkai1111@qq.com
# Created Time:  2019-09-12 11-45-04
# Last modified:	2019-09-12 11-45-04
##################################################################
#!/bin/bash
set -e

echo "0000"
cd /home/kctubt/proj/build
echo "111"
cmake -DCMAKE_BUILD_TYPE=Debug /home/kctubt/proj/APTradingSystem
echo "2222"
if [ $# > 0 ] ; then
    make $1 -j8
else
    make -j8
fi
echo "333"
make install
