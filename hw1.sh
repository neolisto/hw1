#!/bin/bash

#User like var
username=$1
#usercheck like var
usercheck=`getent passwd | cut -d: -f1 | grep $username`

#Verification of user (exist or not exist). All system errors will not showed
echo " User check "
echo
if [ $usercheck == $username ] >/dev/null 2>&1
then
echo " Ok, check passed "
echo
else
#print error message
echo " [!!!ERROR] Following user does not exist [ERROR!!!] "
exit
fi

#folder like var
echo " Folder check "
foldername=$2
foo=$foldername
searchedfolder=`echo ${foo##*/}` 
foldercheck=`cd $foldername >/dev/null 2>&1 && cd .. && ls | grep $searchedfolder`

#Folder verification (exist or not exist). All system errors will not showed
echo
if [ $foldercheck == $searchedfolder ] >/dev/null 2>&1
then
echo " Ok, check passed "
echo " Start chown "
echo
chown $username $foldername >/dev/null 2>&1
echo " Looking good, changes passed "
echo
echo " If u have permissions - changed passed, if not - use sudo "
else
echo " [!!!ERROR] Following folder does not exist [ERROR!!!] "
fi

echo
echo " End of script "
