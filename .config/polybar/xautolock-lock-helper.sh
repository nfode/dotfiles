#!/bin/bash

is_running=false
check-if-running xautolock
[ $? -eq 0 ] && is_running=true

function status  {
    if $is_running ; then
        echo ""
    else
        echo ""
    fi
}

function toogle {
    if $is_running ; then
        pkill xautolock
        is_running=false
    else
        xautolock-start
        is_running=true
    fi
}

case "$1" in
    --status)
        status
        ;;
    --toogle)
        toogle
        status
        ;;
esac
