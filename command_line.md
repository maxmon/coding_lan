## summary

 .\* indicates a hidden file.
 
 grep查找，sed编辑，awk数据分析并生成报告

- source file
- history
- ```find . -name 'my*'```
- ls -a -l -t(by time)
- cp / mv ```cp a.txt b.txt c.txt dir/```
- rm -r(recursive")f(force)
- echo stdin>>stdout/stderr(terminal)
- cat、less、more
- iconv -f编码 ```tail -n 5 | iconv -f GBK(utf8 ascii)```
- head/tail -n(行数) -6(除去前/后6行) ``` head -n -6 log2014.log```
- wc lines, words, characters ```wc -l path```
- mdfind -name homebrew # spotsearch

## sort 

```
sort -r -n -k1 -k2 $midpath/step5_res >$midpath/step5_res_s
```
	
- -u 去重
- -r 降序
- -n 以数值来排序 / **文字、字符排序不能加-n,会出错**
- -n -k1 -k2 以第一列,第二列排序数值大小排序
- -f 忽略大小写
## uniq  `uniq ［-选项］ 文件` 

```
uniq - u - 1 +1 example
```

- c 显示输出中，在每行行首加上本行在文件中出现的次数。取代- u和- d选项。
- d 只显示重复行 
- u 只显示文件中不重复的各行 
- -n 前n个字段与每个字段前的空白一起被忽略。一个字段是一个非空格、非制表符的字符串，彼此由制表符和空格隔开（字段从0开始编号）。
- +n 前n个字符被忽略，之前的字符被跳过（字符从0开始编号）。
- -f n 与- n相同，这里n是字段数。
- -s n 与＋n相同，这里n是字符数

## [grep](http://www.cnblogs.com/peida/archive/2012/12/17/2821195.html) 

*"global regular expression print"* grep [option] pattern file | less   （less分页阅读） 

```
svn log | grep -n my_name
```


- 查找指定进程 ```ps -ef|grep svn```
- 查找指定进程，统计个数 ```ps -ef|grep svn -c```
- 从文件中读取关键词进行搜索,且显示行号 ```cat test.txt | grep -nf test2.txt```
- 从文件中查找关键词 ```grep 'linux' test.txt```
- 从多个文件中查找关键词 ```grep 'linux' test.txt test2.txt```
- 输出非u开头的行内容 ```cat test.txt |grep ^[^u]```
- 输出以hat结尾的行内容 ```cat test.txt |grep hat$```
- 显示包含ed或者at字符的内容行``` cat test.txt |grep -E "ed|at"```

## sed *"stream editor"* 

searches for a text pattern, modifies it, and outputs it.

*在线编辑器，它一次处理一行内容。处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”（pattern space），接着用sed命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕。接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有 改变，除非你使用重定向存储输出*

```
sed 's/snow/rain/g' somefile
```

- s: substitution替换
- snow: the search string, the text to find.
- rain: the replacement string, the text to add in place.
- g: "global" not just first line
- nano command line editor
- zip -r 文件夹 -e 加密 -i out-path ```zip -re hadoop_client.zip hadoop_client ```
- wget ```wget -r -c sh01...com:/home.../data/*```

## awk

[doc](http://coolshell.cn/articles/9070.html)

- ```awk '{print $1, $4}' netstat.txt #1、4列``` 
- ```awk '$3==0 && $6=="LISTEN" ' netstat.txt```
- ```awk ' $3>0 {printf "%-20s %-20s %s\n",$4,$5,$6}' netstat.txt```
- 指定输入分隔符```awk  'BEGIN{FS=":"} {print $1,$3,$6}' /etc/passwd``` or ```awk  -F: '{print $1,$3,$6}' /etc/passwd``` or多个 ```awk  -F'[;:]'```
- 输出分隔符 ```awk  -F: '{print $1,$3,$6}' OFS="\t" /etc/passwd```
- 字符串匹配 ```awk '$6 ~ /FIN|TIME/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt```
- grep一样的匹配```$ awk '/LISTEN/' netstat.txt```
- 取反 ```awk '!/WAIT/' netstat.txt```
- 折分文件 
	- 按第六列分割 ```awk 'NR!=1{print > $6}' netstat.txt```
	- ```awk 'NR!=1{if($6 ~ /TIME|ESTABLISHED/) print > "1.txt";
else if($6 ~ /LISTEN/) print > "2.txt";
else print > "3.txt" }' netstat.txt```
- 统计文件
	- 计算所有的C文件，CPP文件和H文件的文件大小总和```ls -l  *.cpp *.c *.h | awk '{sum+=$5} END {print sum}'```
	- ```awk 'NR!=1{a[$6]++;} END {for (i in a) print i ", " a[i];}' netstat.txt```

内建变量

- $0	当前记录（这个变量中存放着整个行的内容）
- $1~$n	当前记录的第n个字段，字段间由FS分隔
- FS	输入字段分隔符 默认是空格或Tab
- NF	当前记录中的字段个数，就是有多少列
- NR	已经读出的记录数，就是行号，从1开始，如果有多个文件话，这个值也是不断累加中。
- FNR	当前记录数，与NR不同的是，这个值会是各个文件自己的行号
- RS	输入的记录分隔符， 默认为换行符
- OFS	输出字段分隔符， 默认也是空格
- ORS	输出的记录分隔符，默认为换行符
- FILENAME	当前输入文件的名字



