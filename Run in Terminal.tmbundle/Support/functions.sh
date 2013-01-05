#!/bin/bash
tm_exec () {
    NL=$'\r'
	screen -S TextMate -X stuff "$1$NL"
}

# Replace apostrophe ' with '"'"'
esc_ap () {
    echo ${1//"'"/"'\"'\"'"}
}