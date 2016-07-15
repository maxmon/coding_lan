## command

 .\* indicates a hidden file.
 
 grep查找，sed编辑，awk数据分析并生成报告

- source
- ```find . -name 'my*'```
- ls -a -l -t(by time)
- cp / mv ```cp a.txt b.txt c.txt dir/```
- rm -r(recursive")f(force)
- echo stdin>>stdout/stderr(terminal)
- cat、less、more
- iconv -f编码 ```tail -n 5 | iconv -f GBK(utf8 ascii)```
- head/tail -n(行数) -6(除去前/后6行) ``` head -n -6 log2014.log```
- wc lines, words, characters ```wc -l path```
- sort ```sort -r -n -k1 -k2 $midpath/step5_res >$midpath/step5_res_s```
	- -u 去重
	- -r 降序
	- -n 以数值来排序
	- -n -k1 -k2 以第一列,第二列排序数值大小排序
	- -f 忽略大小写
- uniq  *"unique"*去重
- awk
- grep *"global regular expression print"* grep ex path | less   （less分页阅读）
	- -i include upper/lowercase
	- -R search in dirs`grep -R ex /somedir` output filename and line content
	- -Rl search in dirs,output only filename
- sed *"stream editor"* searches for a text pattern, modifies it, and outputs it.
	- *在线编辑器，它一次处理一行内容。处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”（pattern space），接着用sed命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕。接着处理下一行，这样不断重复，直到文件末尾。文件内容并没有 改变，除非你使用重定向存储输出*
	- `sed 's/snow/rain/g' somefile`
		- s: substitution替换
		- snow: the search string, the text to find.
		- rain: the replacement string, the text to add in place.
		- g: "global" not just first line
- nano command line editor
- history 
- zip -r 文件夹 -e 加密 -i out-path ```zip -re hadoop_client.zip hadoop_client ```
- wget ```wget -r -c sh01...com:/home.../data/*```

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

## env

- source makes the changes available right away **in the session we are in**.
- ~/.bash_profile **bash profile** for current user
- alias ` alias pd="pwd"` ncommand allows you to create keyboard shortcuts, 
- environment variables are variables that can be used across commands and programs and hold information about the environment.
	- $PATH $HOME
- export makes the variable to be available to all child sessions initiated from the session you are in
- PS1 `export PS1=">> "	` PS1 is a variable that defines the makeup and style of the command prompt
- env returns a list of the environment variables for the current user
