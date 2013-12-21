#!/bin/bash
#
# Copyright 2012 Arnaud Betremieux <arno@arnoo.net>
# Copyright 2013 William Meng
#
# The program in this file is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

USECOLOR=true;
[[ -t 1 ]] || USECOLOR=false;

function echo_green
        {
        local msg="$1"
    [[ $USECOLOR == true ]] && echo -ne "\E[32m"
        echo "$msg"
        [[ $USECOLOR == true ]] && echo -ne "\033[0m"
        }
function echo_red
        {
        local msg="$1"
        [[ $USECOLOR == true ]] && echo -ne "\E[31m"
        echo "$msg"
        [[ $USECOLOR == true ]] && echo -ne "\033[0m"
        }

HOME_FILES=$(ls -A ./home/)
DIR=$(pwd)/home

cd ~

for f in $HOME_FILES; do
	if [ -L $f ]; then
		echo "Symlink $f already exists!"
	elif [ -f $f ]; then
		echo_red "File $f already exists!"
	elif [ -d $f ]; then
		echo "Directory $f already exists!"
	else
		echo_green "ln -s $DIR/$f ~"
		ln -s $DIR/$f ~
	fi
	#echo $f
done
