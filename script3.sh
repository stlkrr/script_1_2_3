#!/bin/bash

echo -e ' \033[1;35m______________________________________________________________________________This script that will audit your workstation__________________________________________________________________________________'

echo
echo -e '\033[1;31m  Uptime:  \033[1;30m '
echo
uptime
echo

echo -e '\033[1;31m Current users:  \033[1;30m '
echo
users
echo


echo -e '\033[1;31m  Recent logins:  \033[1;30m '
echo
last -s yesterday
echo

echo -e '\033[1;31m  TOP-10 processes by RAM/CPU usage:  \033[1;30m '
echo
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11
echo

# Token
#-t : All TCP ports
#-u : All UDP ports
#-l : Display listening server sockets
#-p : Show the PID and name of the program to which each socket belongs
#-n : Don’t resolve names

echo -e '\033[1;31m Open TCP/UDP ports :  \033[1;30m '
echo
ss -tulpin
echo


echo -e '\033[1;31m  Virtual Memory usage:  \033[1;30m '
#Virtual Memory usage
echo
vmstat
echo

echo -e '\033[1;31m  Usage of disk space:  \033[1;30m '
echo
#POSIX format
df -P
echo

echo -e ' \033[1;35m_______________________________________________________________________________________________________The_End_________________________________________________________________________________'
