##command

 .\* indicates a hidden file.

- find . -name 'my*'
- ls 
	- -a Files started with a dot are hidden,use -a to show all
	- -l format-info >>> rights-links-owner-group-size-date&time-name
	- -t order files and directories by the timecd c
- cp / mv 
	- `cp a.txt b.txt c.txt dir/` list-file
	-  `cp a.txt newdir/a.txt` file-file
- rm 
	- -r "recursive"
- echo stdin>>stdout/stderr(terminal)
- cat output contents to terminal
- wc lines, words, characters
- redirect
	- \> over write ;redirect output target
	- \>> >> append ;redirect input target
	- < out-in
	- | ;redirect left-output as right-input
- sort sorts lines
- uniq  *"unique"*去重
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
- history command history

## env

- source makes the changes available right away **in the session we are in**.
- ~/.bash_profile **bash profile** for current user
- alias ` alias pd="pwd"` ncommand allows you to create keyboard shortcuts, 
- environment variables are variables that can be used across commands and programs and hold information about the environment.
	- $PATH $HOME
- export makes the variable to be available to all child sessions initiated from the session you are in
- PS1 `export PS1=">> "	` PS1 is a variable that defines the makeup and style of the command prompt
- env returns a list of the environment variables for the current user
