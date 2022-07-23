##################################################################
# File Name:     /home/kct/bin/cscope_ctags_env_linux.sh
# Author:        kct
# mail:          lzhkai1111@qq.com
# Created Time:  2017-10-30 21-32-43
# Last modified:	2017-10-30 21-32-43
##################################################################
#!/bin/bash

find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.S"> cscope.files
