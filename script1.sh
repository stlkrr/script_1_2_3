#!/bin/bash

#
# The script is used to compare versions of existing packages for example: python, pbd 
#

echo
echo "                                              ____________________________Hi, enter the name of the package you are testing___________________________"
echo
echo "(for example: python or pbd)" 
read pack
echo
echo "These are available packages on the device on request (2 3): "
echo
ls  /usr/bin | grep $pack
echo
echo "Now write down two desired versions one after the other:" 

read ver1
read ver2

vp1="$pack$ver1 --version"
sol1=$( eval $vp1)

vp2="$pack$ver2 --version"
sol2=$( eval $vp2)

#This is the solution for python2 because this string is not editable

if [[ ["$sol1"]=="Python 2.7.18"  ]]

        then
                :${sol1:= "Python 2.7.18"}
fi

#Writes from the verses only the number and the second digit after the dot
echo
num_var1=$(grep -Eo '[ ]+[0-9]+[.]+[0-9]'<<< "${sol1}")
num_var2=$(grep -Eo '[ ]+[0-9]+[.]+[0-9]'<<< "${sol2}")
echo

old_pack=""
new_pack=""

if [[ "$num_var1" > "$num_var2" ]]
        then
                echo "This version of $sol1 is a new version of the $pack package, so it contains more useful features than $sol2"
		:${old_pack:= "$sol2" }
		:${new_pack:= "$sol1" }

        else
                echo "This version of $sol2 is a new version of the $pack package, so it contains more useful features than $sol1"
		:${old_pack:= "$sol1" }
		:${new_pack:= "$sol2" }

fi

echo
echo
echo

def_pack="$pack --version"
dp=$(eval $def_pack)

echo

if [[ $dp == $new_pack ]]
        then
                echo "Your device is the default new version: $new_pack "
	else
		echo "Your device is the default old version: $old_pack "
fi

#The function of automatic change of a alias by default of the new version was planned, but I won't have time
