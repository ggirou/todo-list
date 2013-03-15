#!/bin/bash 

function prepareDeploy {
	# Replace package symlinks with real files
	for dir in $(find ./packages/ -type l)
	do
		local rawDir=$(readlink $dir)
		echo Copy $rawDir to $dir 
		cp -r $rawDir $dir.tmp
		rm -r $dir
		mv $dir.tmp $dir
	done

	# Replace .gitignore with the deploy version
	echo mv -f .gitignore.deploy .gitignore
}

function deploy {
	local remote=$1
	local branch=$2
	echo git remote add github $remote
	echo git add .
	echo git commit -m 'Deploy'
	echo git push --force github master:$branch
}

E_BADARGS=65

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` git@github.com:username/project.git branch"
  exit $E_BADARGS
fi

prepareDeploy 
deploy $1 $2
