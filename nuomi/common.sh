#!/bin/bash

function tlog()
{
    timestamp=`date "+%Y-%m-%d %H:%M:%S"`
    echo "[$timestamp] $1"
}


function get_python()
{
    if [ -f /home/opt/python2.7.5/bin/python2.7 ]
    then
        echo /home/opt/python2.7.5/bin/python2.7
    elif [ -f ~/python/bin/python ]
    then
        echo ~/python/bin/python
    else
        #tlog "[WARNING] cannot find ~/python/bin/python, using system python, might run fail!"
        default=`which python`
        echo $default
    fi
}

