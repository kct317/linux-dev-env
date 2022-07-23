#!/bin/bash
if [ $# -lt 1 ] ; then 
    echo "usage: ./search search_string"
    exit 
fi
find . -iname "*.[ch]"| xargs grep "$1" --color=auto -n

