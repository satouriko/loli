#!/bin/bash
#########################################################################
# File Name: loli.sh
# Author: LI JIAHAO
# ###############
# Mail: lijiahao@cool2645.com
# Created Time: Thu 15 Mar 2018 04:01:19 PM CST
#########################################################################

version='Anju'

case $1 in
version | -v | --version)
    echo $version
    ;;
help | -h | --help)
    echo 'usage: loli [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common loli commands used in various situations:

blessed with loli
   chira                        Check if there is an update
   bath                         Update loli
   help                         Show loli help
   
working with loli
   lift                         git add .
   commit [<args>]              git commit $args -s (loli commits with signature automatically)
   touch                        git commit --amend -s
   rub [<args>]                 git push -f $args
   hug [<remote>] [<branch>]    git fetch $remote && git reset --hard $remote/$branch (origin/master as default)
   
using loli like git
   push [<args>]                git push $args
   pull [<args>]                git pull $args
   <whatever-else-command>      git $as-it
   '
   ;;
bath)
    sudo wget -O /usr/bin/loli https://raw.githubusercontent.com/rikakomoe/loli/master/loli.sh
    sudo chmod +x /usr/bin/loli
    ;;
chira)
    latest=`curl https://raw.githubusercontent.com/rikakomoe/loli/master/version.txt`
    if [ ! "$latest" == "$version" ];then
        echo "A younger loli is here."
        echo "Her name is $latest."
        echo "Do you want her? [Y/n]"
        echo "(Your loli names $version)"
        read hentai
        if [[ $hentai != 'n' ]] && [[ $hentai != 'N' ]];then
            loli bath
        fi
    else
        echo "Your loli's name is $version."
        echo "She remains as the youngest loli till now."
    fi
    ;;
rub)
    if [ ! -n "$3" ];then
        git push -f $2 $3
    elif [ ! -n "$2" ];then
        git push -f $2
    else
        git push -f
    fi
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
*)
    git "$@"
    ;;
esac
