## 开发机

ssh 

- ssh [name]@relay01.baidu.com
- ssh cq01-ps-dev199.cq01

smb 远程数据和本地命令环境的结合

- finder -> 前往服务器 -> smb://cq01-ps-dev199.cq01.baidu.com
- 用户名 \[name]
- 密码

## comake2

增量编译

comake2 -> COMAKE -> Makefile

- comake2 -S 新建空白COMAKE
- comake2 -UB 
- comake2 -P 更新Makefile文件
- make

## 登录线上服务器

- [nova](http://noah.baidu.com/new/templates/new.html)权限申请
- ssh relay
- ssh 线上服务器地址

## 拿数据wget

wget [ssh服务器路径:目录绝对路径] 

- -r 目录
- -c 断点续传