#!/usr/bin/bash 

function createDB
{
	existFlag=true
	while test $existFlag == true
	do
		echo "Enter DataBase name"
		read
		#check if database exists
		for el in `ls ../Data`
			do
				if test $REPLY == $el
				then
				echo "DataBase already exists"
				existFlag=true
				break
				else
				existFlag=false
				
				fi
			done
	done

	#create Database directory and Schema
	mkdir ../Data/$REPLY
	touch ../Data/$REPLY/Schema

	#test DataBase creation then echo successful msg
	while test $existFlag == "false"
		do
		for el in `ls ../Data`
			do
			if test $REPLY == $el
				then
				echo "DataBase Created Successfully "
				existFlag="true"
			fi
		done
	done
} 

createDB
