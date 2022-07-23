##################################################################
# File Name:     .bin/linecounter.sh
# Author:        kct
# mail:          lzhkai1111@qq.com
# Created Time:  2020-01-10 09-57-36
# Last modified:	2020-01-10 09-57-36
##################################################################
#!/bin/bash
total_file_list=`find ./ -regex  ".*\.c\|.*\.cpp\|.*\.hpp\|.*\.h"`
for file in ${total_file_list}
do
    count=`wc -l ${file}|awk -F ' ' '{print $1}'`
    echo -e "line count:"${count}"\tfile: "${file}
    total=`expr ${total} + ${count}`
done

echo -e "total: "${total}
