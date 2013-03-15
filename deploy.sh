#!/bin/bash 

# Replace package symlinks with real files
function copySymLink {
	for dir in $(find $1 -type l)
	do
		local rawDir=$(readlink $dir)
		echo Copy $rawDir to $dir 
		cp -r $rawDir $dir.tmp
		rm -r $dir
		mv $dir.tmp $dir
	done
}

function prepareDeploy {
	copySymLink ./packages/
	copySymLink .

	# Replace .gitignore with the deploy version
	mv -f .gitignore.deploy .gitignore
}

function deploy {
	local remote=$1
	local branch=$2
	git remote add github $remote
	git add .
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
