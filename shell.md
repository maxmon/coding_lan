- \#!/bin/bash
- ps | grep $$
- which bash
- ${PWD##*/} ＃当前目录名

## note

- shell加载的file修改过需要 `source path`重新加载下


## var

$var

转义 A backslash "\" is used to escape special character meaning

"" 保持原样 Encapsulating the variable name with "" will preserve any white space values

``  command命令 (known as back-ticks) or with $() 

read var_name #get input

## Passing Arguments to the Script

从1开始计算$n

	./bin/my_shopping.sh apple 5 banana 8 "Fruit Basket" 15
	echo $3 --> results with: banana
	
The variable $# holds the number of arguments passed to the script

###Array

- my_array=()
- ${my_array[n]}
- ${#my_array[@]}-i #len - i

my_array=(apple banana "Fruit Basket" orange)
echo ${my_array[3]}                     # orange - note that curly brackets are needed
my_array[4]="carrot"                    # value assignment without a $ and curly brackets
echo ${#my_array[@]}                    # 5
echo ${my_array[${#my_array[@]}-1]}     # carrot

## Basic Arithmetic Operators

$((expression))

- + - * / % **

###String Operations

- ${#STRING}  #len
- expr index "$STRING" "$SUBSTRING" #SUBSTRING 中任意char 第一个match string的index（从1开始）
- substring 
	- `STRING="this is a string"
POS=1
LEN=3
echo ${STRING:$POS:$LEN}   # his`
	- `echo ${STRING:2} # his is a string` 	

- Simple data extraction example:

		DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
		COMMA1=`expr index "$DATARECORD" ','`  # 14 position of first comma
		CHOP1FIELD=${DATARECORD:$COMMA1}       #
		COMMA2=`expr index "$CHOP1FIELD" ','`
		LENGTH=`expr $COMMA2 - 6 - 1`
		FIRSTNAME=${CHOP1FIELD:6:$LENGTH}      # Johnny Boy
		echo $FIRSTNAME

- replace string

		STRING="to be or not to be"
		echo ${STRING[@]/be/eat}        # to eat or not to be
		echo ${STRING[@]//be/eat}        # to eat or not to eat
		echo ${STRING[@]/#to be/eat now}    # eat now or not to be #replace beginning
		echo ${STRING[@]/%be/eat}        # to be or not to eat #replace end 
		echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2012-06-14 #replace occurrence of substring with shell command output



###Making Decision

- == != < > 
- -z "$a"判空

if [ expression ]; then
code if 'expression' is true
elif [ expression2 ]; then
code
fi

case "$variable" in
    "$condition1" )
        command...
    ;;
    "$condition2" )
        command...
    ;;
esac

	mycase=1
	case $mycase in
    	1) echo "You selected bash";;
    	2) exit
	esac
	
## Loop

- break
- continue


for arg in [list]
do
 command(s)...
done

while [ condition ]
do
 command(s)...
done

until [ condition ]
do
 command(s)...
done

	NAMES=(Joe Jenny Sara Tony)
	for N in ${NAMES[@]} ; do
  		echo "My name is $N"
	done
	
	COUNT=4
	while [ $COUNT -gt 0 ]; do
  		echo "Value of count is: $COUNT"
  		COUNT=$(($COUNT - 1))
	done
	
## function

function_name {
  command...
}

	function adder {
  		echo "$(($1 + $2))"
	}
	