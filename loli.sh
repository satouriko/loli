#!/bin/bash
#########################################################################
# File Name: loli.sh
# Author: LI JIAHAO
# ###############
# Mail: lijiahao@cool2645.com
# Created Time: Thu 15 Mar 2018 04:01:19 PM CST
#########################################################################

version='Cocoa'

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
   touch                        git commit --amend --date=now
   stroke                       loli touch --no-edit
   rub [<args>]                 git push -f $args
   suck                         loli lift && loli stroke && loli rub
   hug [<remote>] [<branch>]    git fetch $remote && git reset --hard $remote/$branch
   kiss                         git clean -fd
   forget [<args>]              git update-index --assume-unchanged $args
   
using loli like git
   commit [<args>]              git commit $args
   push [<args>]                git push $args
   pull [<args>]                git pull $args
   <whatever-else-command>      git $as-it
   '
   ;;
bath)
    sudo wget -O /usr/bin/loli https://raw.githubusercontent.com/rikakomoe/loli/master/loli.sh
    sudo chmod +x /usr/bin/loli
    exit 0
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
    shift
    git push -f "$@"
    ;;
hug)
    branch=`git rev-parse --abbrev-ref HEAD`
    if [ -n "$2" ];then
        remote=$2
        if [ -n "$3" ];then
            branch=$3
        fi
        upstream="$remote/$branch"
    else
        remote=`git for-each-ref --format='%(upstream:remotename)' $(git symbolic-ref -q HEAD)`
        upstream='@{u}'
    fi
    git fetch $remote && git reset --hard $upstream
    ;;
kiss)
    shift
    git clean -fd "$@"
    ;;
lift)
    shift
    git add . "$@"
    ;;
touch)
    shift
    git commit --amend --date=now "$@"
    ;;
stroke)
    shift
    loli touch --no-edit "$@"
    ;;
suck)
    shift
    loli lift && loli stroke && loli rub "$@"
    ;;
commit)
    shift
    if [ ! -x "$(command -v gitmoji)" ] || [[ -n "$@" ]]; then
        git commit "$@"
    else
        gitmoji -c
    fi
    ;;
forget)
    shift
    git update-index --assume-unchanged "$@"
    ;;
*)
    git "$@"
    ;;
esac
