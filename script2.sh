#!/bin/bash

echo -e '\033[1;37m                                                                   __________________Informarion about  the operation system____________________                                                          '

echo  'Please, enter your password for begining. . . '


OS="$(sudo uname)"

echo
echo -e "\033[1;31m  Basic information about your distribution $OS \033[1;30m"
echo

	cat /etc/os-release


echo
echo -e '\033[1;31m Version kernel: \033[1;30m '
echo

	uname -r

echo
echo -e '\033[1;31m Network Interfaces: \033[1;30m'
echo

	ifconfig -s

echo
echo -e '\033[1;31m Firewall Configuration: \033[1;30m '
echo

	sudo cat /etc/default/ufw | grep -v "#" 
echo

echo -e '\033[1;37m                                                                                      _______________The End________________                                          '
