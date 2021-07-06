#!/bin/bash

#User like var
username=$1
usercheck=`getent passwd | cut -d: -f1 | grep $username`

#Verification of user (exist or not exist). All system errors will not showed
echo "User check"
echo
if [ $usercheck == $username ] >/dev/null 2>&1
then
echo "User exist, check passed"
echo
else
#print error message
echo "[!!!ERROR] Following user does not exist [ERROR!!!]"
exit
fi

#folder like var
foldername=$2
foldercheck=`ls | grep $foldername`

#Folder verification (exist or not exist). All system errors will not showed
echo "Folder check"
echo
if [ $foldercheck == $foldername ] >/dev/null 2>&1
then
chown $1 $2
echo "Folder exist, changes compited"
else
echo "[!!!ERROR] Following folder does not exist [ERROR!!!]"
fi
