
- setwd("path")
- getwd()#pwd for working dir
- read.csv("xxx.csv")
- dir() #ls
- ls() #list all obj 
- source("codepath") #load code
- code fucntion name to show code

## objects:

- character
- numeric
- integer
- complex
- logical

## datastruct

index starts from 1

#### vector & list: support same&diff class

*list like excel table*

Inf: special number,

- NaN:numrecial missing value
- NA:others

	is.na(x)
	is.nan(x)


attributes()

c(T,F) #create vectors
list(1,"a")#create list

as.logical()

#### matrix

	m <- matrix(nrow = 2,ncol = 3)
	m2 <- matrix1:6,nrow = 2,ncol = 3)
	dim(m)
	dim

	#transform
	m <- 1:10
	dim(m) <- c(2,5)
	
	     [,1] [,2] [,3] [,4] [,5]
	[1,]    1    3    5    7    9
	[2,]    2    4    6    8   10
	
	#binding col and row
	cbind(x,y,z)
     x y  z
	[1,] 1 7 -3
	[2,] 2 8 -2
	[3,] 3 9 -1
	rbind(x,y,z)
	[,1] [,2] [,3]
	x    1    2    3
	y    7    8    9
	z   -3   -2   -1
	
use drop arg to get subsetting 
	
#### factors

分类数据（labels），order or unordered

	x <- factor(c("rrr","ffff"."rrr"),levels = c("ffff","rrr"))

#### data frames

matrix thar support diff type;col obj must be same type

read.table() read.csv()

data.matrix(x)

	> x <- data.frame(foo = 7:9,bar = c(T,F, F))
	> x
	  foo   bar
	1   7  TRUE
	2   8 FALSE
	3   9 FALSE

diff list :
 ()
- you can't use the same name for two different variables (as list)
- all elements of a data frame are vectors
- all elements of a data frame have an equal length.
#### names attribute

vector list matrix

dimnames(matrix)

## IO

#### opt read.table

for large dataset read help page to opt  usage of 
read.table()

comment.char = ""

colClasses try to figure out data type every col

	intial <- read.table("datatable.txt", nrows = 100) #read 100 rows data;help r to init memory
	classes <- sapply(initial,calss)
	tabAll <- read.table("datatable.txt", colClasses = classes)
	
almost 2*data_requirs memory

####dput dget & dmup source

####to out

- gzfile
- bzfile
- file
- url

#### readLines

## [] [[]] $ subset

[index] : returns obj as parent ;;index as colum-index

[[index]] : returns item ---- list(sequence)

[[$name_index]] or x$name)index : returns item by name

#### for list 

x[c(3,8)] #return 3th seq and 8th seq 

x[[c(3,8)]] #return item on 3th rou/seq and 8th col

####for matrix

x[1,2] reutrns item-vector in matrix 

x[1,2, drop = FLASE] reutrns matrix 
 
 

#### numerical index and logical index

#### partial matching

	x <- list(aaa= 1:5)
	x$a
	x[["a", exact = F]]
	
	多个匹配return NULL

#### complete.cases(x,y)

logical or

#### %*% true matrix multiplication

## condition control

#### if - else 

	y <- if(x>3) {
		10
	} else {3}
	
		
#### for

	for(i in seq_along(array)) { }
	
	for(i in seq_len(nrou(x))) {
		for(j in seq_len(ncol(x))) {}
		 }
		 
#### repeat

	repeat {
		...
		break
	}
		
#### break next return 

function returns last expression value

## function

a functuon can be defined in function

name <- function(x) {}

last value as return value
#### arument matching

by name arguments doesn't need to be ordered

1. name match
2. partial match
3. positional match

####lazy evaluation

eval argument only when it is needed

#### ... argument

partial match and positional match can't used after ...

	>args(function_name)

#### environment order

search()

#### 函数内修改全局变量，仅在函数作用域内生效

## Date Time

time POSIXct

	x <- as.Date("1970-01-01") # value 0
	# as.POSIClt
	y <- Sys.time()
	
use function strptime



	

