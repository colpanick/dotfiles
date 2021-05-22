#!/bin/bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run /usr/local/share/light_dm/startup.sh
run /usr/bin/VBoxClient-all
run /usr/bin/imwheel
run ~/bin/enable_mic
