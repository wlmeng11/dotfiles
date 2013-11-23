#!/bin/bash

FILES=$(ls -A ./home/)
#HOME_FILES=$(find ./home -maxdepth 1 -type f -printf '%f\n')
HOME_FILES=$FILES
#echo $FILES
#DIR=$(pwd | sed 's/\/home\/'$USER'/~/g')/home/
DIR=$(pwd)/home
#echo $DIR

cd ~

for f in $HOME_FILES; do
	if [ -f $f ]; then
		echo File $f already exists!
	elif [ -h $f ]; then
		echo Symlink $f already exists!
	elif [ -d $f ]; then
		echo Directory $f already exists!
	else
		echo "ln -s $DIR/$f ."
		ln -s $DIR/$f .
	fi
	#echo $f
done
