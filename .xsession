#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login
#
[ -f ~/.zprofile ] && . ~/.zprofile
[ -f ~/.extend.xsession ] && . ~/.extend.xsession

