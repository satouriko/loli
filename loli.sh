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
    if [ ! -n "$2" ];then
        remote='origin'
    else
        remote=$2
    fi
    if [ ! -n "$3" ];then
        branch='master'
    else
        branch=$3
    fi
    git fetch $remote && git reset --hard $remote/$branch
    ;;
lift)
    git add .
    ;;
touch)
    git commit --amend -s
    ;;
commit)
    git "$@" -s
    ;;
bath)
    sudo wget -O /usr/bin/loli https://raw.githubusercontent.com/rikakomoe/loli/master/loli.sh
    sudo chmod +x /usr/bin/loli
    ;;
*)
    git "$@"
    ;;
esac
