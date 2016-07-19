- \#!/bin/bash
- ps | grep $$
- which bash
- ${PWD##*/} ＃当前目录名

## note

- shell加载的file修改过需要 `source path`重新加载下


## var

$var

转义 A backslash "\" is used to escape special character meaning

"" 保持原样. Encapsulating the variable name with "" will preserve any white space values

``  command命令 (known as back-ticks) or with $() 

read var_name #get input

## Passing Arguments to the Script

从1开始计算$n

	./bin/my_shopping.sh apple 5 banana 8 "Fruit Basket" 15
	echo $3 --> results with: banana
	
The variable $# holds the number of arguments passed to the script

###Array

- my_array=()
- ${my_array[i]}
- ${#my_array[@]} #len 

```
my_array=(apple banana "Fruit Basket" orange)
echo ${my_array[3]}                     # orange - note that curly brackets are needed
my_array[4]="carrot"                    # value assignment without a $ and curly brackets
echo ${#my_array[@]}                    # 5
echo ${my_array[${#my_array[@]}-1]}     # carrot
```

## Basic Arithmetic Operators

$((expression))

- + - * / % **

### String Operations

- ${#STRING}  #len
- expr index "$STRING" "$SUBSTRING" #SUBSTRING 中任意char 第一个match string的index（从1开始）
- substring 
	- `STRING="this is a string"
POS=1
LEN=3
echo ${STRING:$POS:$LEN}   # his`
	- `echo ${STRING:2} # his is a string` 	

- Simple data extraction example:

```
		DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
		COMMA1=`expr index "$DATARECORD" ','`  # 14 position of first comma
		CHOP1FIELD=${DATARECORD:$COMMA1}       #
		COMMA2=`expr index "$CHOP1FIELD" ','`
		LENGTH=`expr $COMMA2 - 6 - 1`
		FIRSTNAME=${CHOP1FIELD:6:$LENGTH}      # Johnny Boy
		echo $FIRSTNAME
```

- replace string

```
		STRING="to be or not to be"
		echo ${STRING[@]/be/eat}        # to eat or not to be
		echo ${STRING[@]//be/eat}        # to eat or not to eat
		echo ${STRING[@]/#to be/eat now}    # eat now or not to be #replace beginning
		echo ${STRING[@]/%be/eat}        # to be or not to eat #replace end 
		echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2012-06-14 #replace occurrence of substring with shell command output
```


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
	
	
## 多进程

- sleep 1    睡眠1秒
- sleep 1s    睡眠1秒
- sleep 1m   睡眠1分
- sleep 1h   睡眠1小时
- wait [n] 等待进程号为n的后台进程终止

```
...
{command...} & #后台进程执行
...
wait #wait前面后台进程执行完毕
```

## 参数处理

- $#	传递到脚本的参数个数
- $*	以一个单字符串显示所有向脚本传递的参数。
如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。
- $$	脚本运行的当前进程ID号
- $!	后台运行的最后一个进程的ID号
- $@	与$*相同，但是使用时加引号，并在引号中**返回每个参数**。
如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。
- $-	显示Shell使用的当前选项，与set命令功能相同。
- $?	显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。

## env

- source makes the changes available right away **in the session we are in**.
- ~/.bash_profile **bash profile** for current user
- alias ` alias pd="pwd"` ncommand allows you to create keyboard shortcuts, 
- environment variables are variables that can be used across commands and programs and hold information about the environment.
	- $PATH $HOME
- export makes the variable to be available to all child sessions initiated from the session you are in
- PS1 `export PS1=">> "	` PS1 is a variable that defines the makeup and style of the command prompt
- env returns a list of the environment variables for the current user