#!/usr/bin/bash
#$1: case select, $2: DBname, $3: Tablename, $4: PKname
function getraw 
{
	#$1: Dbname, $2: Tablename, $3: what we search (table name,raw pk), $4: delemiter
        typeset -i counter=1
	typeset keys=`cut -d "$4" -f1 ../Data/$1/$2`
        for key in $keys
        do
                if [ $3 == $key ]
                then
                        rawnum=$counter
                        break
                fi
                ((counter=counter+1))
        done
        return $rawnum

}


case $1 in 
db)
existFlag="false"
		for element in `ls ../Data`
			do
			if test $2 == $element
				then
				rm -rf ../Data/$2
				existFlag="true"
				break
			fi
			done
	if test $existFlag = "true"
	then
	echo "DataBase Deleted sucssefully :("
	else
	echo "ERROR: DataBase Doesn't exist :("
	fi
;;

table)
existFlag="false"
                for element in `ls ../Data/$2`
                        do
                        if test $3 == $element
                                then
                                rm ../Data/$2/$3
                                existFlag="true"
                                break
                        fi
                        done
        if test $existFlag = "true"
        then
	getraw $2 'Schema' $3 " "
        rawNum=$rawnum
        if [ $rawNum ]
        then
                `sed -i $raw'd' ../Data/$2/Schema`
        else
                echo "There is no Db record"
        fi
        else
        echo "Error table Doesn't exist"
        fi
;;
#$1: case select, $2: DBname, $3: Tablename, $4: PKname
raw)
#$1: Dbname, $2: Tablename, $3: what we search (table name,raw pk), $4: delemiter
	getraw $2 $3 $4 "|"
	raw_num=$rawnum
	if [ $raw_num ]
	then
		`sed -i $raw_num'd' ../Data/$2/$3`
		echo "Raw is deleted :("
	else
		echo "There is no raw with that PK: " $4
	fi

	
;;
esac

