#!/bin/sh
# power.sh
#
# Run certain power-management commands without entering a password
#

if [ -z "$1" ]; then
	echo "Starting up visudo with this script as first parameter"
	export EDITOR=$0 && sudo -E visudo
else
	echo "Changing sudoers file"
	echo >> $1
	echo "%power ALL=(ALL) NOPASSWD:/sbin/shutdown -h now"  >> $1
	echo "%power ALL=(ALL) NOPASSWD:/sbin/reboot"           >> $1
	echo "%power ALL=(ALL) NOPASSWD:/usr/sbin/pm-suspend"   >> $1
	echo "%power ALL=(ALL) NOPASSWD:/usr/sbin/pm-hibernate" >> $1
	echo "%power ALL=(ALL) NOPASSWD:/usr/sbin/pm-powersave" >> $1
fi
