#!/bin/bash
#########################################################################
# File Name: loli.sh
# Author: LI JIAHAO
# ###############
# Mail: lijiahao@cool2645.com
# Created Time: Thu 15 Mar 2018 04:01:19 PM CST
#########################################################################

case $1 in
rub)
    git push -f
    ;;
hug)
    git fetch && git reset --hard HEAD
    ;;
lift)
    git add .
    ;;
touch)
    git commit --amend
    ;;
*)
    git $*
    ;;
esac
