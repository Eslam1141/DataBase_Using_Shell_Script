#!/usr/bin/bash

typeset -i counter=1
function start {
PS3="LeMoZDB >> "
#to Display menu
echo "***********************welcome to LeMoZ DB**************************"
select l in "Create New DataBase" "Open Current DataBase " "Delete Current DataBase" "Exit"
do
case $REPLY in
1)echo "********************************************************************" 
echo "Create new DatabBase"
./CreateDB.sh
;;
2)echo "********************************************************************" 
echo "Open Current DataBase"
echo "Enter DataBase Name"
read
existFlag="false"
	for el in `ls ../Data`
	do

	if test $REPLY == $el
		then
		
		export db_name=$REPLY
		#$1 DB

		./OpenDB.sh $REPLY

		
		existFlag="true"
		fi		
		done
if test $existFlag == "false"
then
echo "DataBase Not Found Please enter another DataBase Name"
fi
counter+=1
start
;;
3)echo "********************************************************************" 
echo "WARNING: you are about to delete the entire DataBase ARE you sure [y/n]"
read
if [[ $REPLY == "y" ]]
then
echo "Enter DataBase name to Delete"
read
./Delete.sh "db" $REPLY
fi
;;
4)echo "********************************************************************" 
echo "Bye Bye :D"
break $counter
;;
esac
done
}

start
