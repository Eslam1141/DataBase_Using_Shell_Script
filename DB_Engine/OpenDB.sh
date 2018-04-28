#!/usr/bin/bash

#Open Data Base for manipulating
PS3="$db_name DB> " 
echo "********************************************************************"
select x in "Create New Table" "Insert In a Table" "show Table" "show row" "Update Table" "Delete Row" "Delete Table" "Go to start Menu"
do

case $REPLY in
1) echo "********************************************************************"
echo "Create Table"
./mktable.sh $1
;;
2)echo "********************************************************************" 
echo "Insert In a Table"
echo "Enter Table name"
read
exist_flag="false"
                for element in `ls ../Data/$1`
                        do
                        if test $REPLY == $element
                                then
                             	./Insert.sh $1 $REPLY
                                exist_flag="true"
                                break
                        fi
                        done
if test $exist_flag == "false"
then
echo "Table Doesn't Exist"
fi
#./Insert.sh $1 $REPLY
;;
3)echo "********************************************************************"
 echo "Display Table"
echo "Enter Table name"
read
exist_flag="false"
                for element in `ls ../Data/$1`
                        do
                        if test $REPLY == $element
                                then
                             	awk -F"|" '{print $0}' ../Data/$1/$REPLY
                                exist_flag="true"
                                break
                        fi
                        done
if test $exist_flag == "false"
then
echo "Table Doesn't Exist"
fi
;;
4)echo "********************************************************************"
 echo "show row"
	echo "Row id"
#read table
read row
awk -F"|" '{for (i=1;i<=NF;i++) 
if ($i == $row) {print $0}}' /home/Lemoz/Desktop/LemoZDB/Data/ITI


;;
5)echo "********************************************************************"
 echo "Update Table"
	echo "Enter Table name"
read
exist_flag="false"
                for element in `ls ../Data/$1`
                        do
                        if test $REPLY == $element
                                then
				#$1 DB $2 $Reply >> table
                             	./Update.sh $1 $REPLY
                                exist_flag="true"
                                break
                        fi
                        done
if test $exist_flag == "false"
then
echo "Table Doesn't Exist"
fi
;;
6)echo "********************************************************************"
 echo "Delete Row" 
echo "Enter Table name to Delete"
read tablename
echo "WARNING: you are about to delete the entire raw ARE you sure [y/n]"
read
if [[ $REPLY == "y" ]]
then
echo "Enter Primary key to Delete "
read pk
#$1 DB $2 table 
./Delete.sh "raw" $1 $tablename $pk 
fi

;;
7)echo "********************************************************************" 
echo "Delete Table"
echo "Enter Table name to Delete"
read
./Delete.sh "table" $1 $REPLY
;;
8)echo "********************************************************************"
 echo "Main"
break
esac
done

