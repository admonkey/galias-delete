#!/bin/bash

clean_remote(){
	if [ -z $1 ]; then echo "error: remote required"; return; fi
	if [ -z $2 ]; then echo "error: branch required"; return; fi
	git branch -a --merged remotes/$1/$2 | grep -v $2 | grep "remotes/$1/" | cut -d "/" -f 3 | xargs -n 1 git push --delete $1
}
