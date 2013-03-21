#!/bin/bash 

# Replace package symlinks with real files
function copySymLink {
	for dir in $(find $1 -type l)
	do
		local rawDir=$(readlink -f $dir)
		echo Copy $rawDir to $dir 
		cp -r $rawDir $dir.tmp
		rm -r $dir
		mv $dir.tmp $dir
	done
}

function prepareDeploy {
	copySymLink ./packages/
	copySymLink .
}

function deploy {
	local remote=$1
	local branch=$2
	git remote add github $remote
	git add .
	git rm --cached $0
	git commit -m 'Deploy'
	git push --force github master:$branch
}

E_BADARGS=65

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` git@github.com:username/project.git branch"
  exit $E_BADARGS
fi

prepareDeploy 
deploy $1 $2
