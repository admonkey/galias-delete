#!/bin/bash

git_clean_merged_remote(){
	if [ -z $1 ]; then echo "error: remote required"; return; fi
	if [ -z $2 ]; then echo "error: branch required"; return; fi
	git branch -a --merged remotes/$1/$2 | grep -v $2 | grep "remotes/$1/" | cut -d "/" -f 3 | xargs -n 1 git push --delete $1
}

alias gcr='git_clean_merged_remote'
__git_complete gcr _git_pull

git_clean_merged_local(){
	if [ -z $1 ]; then echo "error: branch required"; return; fi
	git branch --merged | egrep -v "(^\*|$1)" | xargs git branch -d
}

alias gcl='git_clean_merged_local'
__git_complete gcl _git_checkout
