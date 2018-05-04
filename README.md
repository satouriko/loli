# loli

![](https://img.shields.io/badge/dynamic/json.svg?label=version&url=https%3A%2F%2Fraw.githubusercontent.com%2Frikakomoe%2Floli%2Fmaster%2Fversion.json&query=%24.version&colorB=de698c)

```
萝莉有三好——声娇体软易推倒
```

A shell command which is an alias to git.

## Install

```
sudo wget -O /usr/bin/loli https://raw.githubusercontent.com/rikakomoe/loli/master/loli.sh
sudo chmod +x /usr/bin/loli
```

## Usage
```
usage: loli [--version] [--help] [-C <path>] [-c <name>=<value>]
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
   forget [<args>]              git update-index --assume-unchanged $args
   
using loli like git
   push [<args>]                git push $args
   pull [<args>]                git pull $args
   <whatever-else-command>      git $as-it
```

## Contribute

Feel free to contribute by Issue and Pull Request if you come up with anything convenient and interesting.
