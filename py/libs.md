- <a href="#Python增强"> Python增强 </a>
	- <a href="#pip"> pip </a>
	- <a href="#math"> math </a>
	- <a href="#time"> time </a>
	- <a href="#datetime"> datetime </a>
	- <a href="#itertools"> 循环器 (itertools) </a>
	- <a href="#sqlite"> sqlite </a>
- <a href="#系统交互"> 系统交互 </a>
	- <a href="#commands"> commands </a>
	- <a href="#os 文件管理"> os 文件管理 </a>
	- <a href="#os 进程管理"> os 进程管理 </a>
	- <a href="#os.path"> os.path 路径管理 </a>
	- <a href="#shutil"> shutil: 文件操作工具 </a>
	- <a href="#re"> re:正则表达式regular expression </a> 
	- <a href="#glob"> glob: 正则表达式 on file </a>
	- <a href="#pickle"> pickle cPickle：存储对象 </a>
	- <a href="#subprocess"> subprocess 运行外部程序: 实现shell </a>
	- <a href="#subprocess.Popen"> subprocess.Popen：shell式进程管理 </a>
	- <a href="#signal"> signal：信号机制 </a>
	- <a href="#thread and syc"> thread and syc：线程和同步 </a>
	- <a href="#multi process"> multi process：多进程 </a>

	
<a name="Python增强" ></a>
	
# Python增强

lib的所有搜索路径

	import sys
	print(sys.path) #搜索路径

<a name="pip" ></a>

## pip

pip是Python自带的包管理程序，它连接Python repository，并查找其中可能存在的包

$pip install web.py

$pip uninstall web.py

$pip install --upgrade web.py

设置pip的安装包的路径:

$pip install --install-option="--prefix=/home/vamei/util/" web.py

<a name="math" ></a>

## [math](http://www.cnblogs.com/vamei/archive/2012/10/26/2741702.html)

- round()
- math包
- random包;也可以参见numpy.md的 `Random number generation`

最值

- max(arg) min(arg)
- abs(arg)

虚数

1 + 2j

<a name="time" ></a>

## time 

unit second

import time

- time.time()
- time.clock()
- time.sleep()
- time.gmtime()      # 返回struct_time格式的UTC时间
- time.localtime()   # 返回struct_time格式的当地时间, 当地时区根据系统环境决定。
- time.mktime(st)    # 将struct_time格式转换成wall clock time

<a name="datetime" ></a>

## datetime

	from datetime import datetime
	datetime.date.today-datetime.timedelta(1)
	datetime.datetime.now()
	
- datetime.date
- datetime.time
- datetime.timedelta #dateime类型的差值 `datetime.timedelta(days=1)`

hour, minute, second, microsecond, year, month, day, weekday   # weekday表示周几

datetime.datetime 可以比较大小，可以运算＝／－ by datetime.timedelta

%Y-%m-%d %H:%M:%S datetime.strptime(str, format) obj.strftime(format)

<a name="itertools" ></a>

## [循环器 (itertools)](http://www.cnblogs.com/vamei/p/3174796.html)

pass

<a name="sqlite" ></a>

## [sqlite](http://www.cnblogs.com/vamei/p/3794388.html)

<a name="系统交互" ></a>

# 系统交互

<a name="commands" ></a>

## commands

	import commands
	(status, output) = commands.getstatusoutput('cp -fr ...')
	commands.getoutput('ls .')
	
<a name="os 文件管理" ></a>

## os 文件管理

os包的一些命令就是用于文件管理

- os.getcwd()
- os.listdir(os.curdir)
- os.mkdir(path)
- os.listdir(path)
- os.remove(path)
- os.rename(src,dst)
- os.chmod(path, mode)
- os.rmdir(path)
- os.chown(path, uid, gid)
- os.symlink(src, dst) # $ln -s
- os.stat(path) #$ls -l

进程kill

- os.kill(pid, sid)
- os.killpg(pgid, sid)

<a name="os 进程管理" ></a>

## os 进程管理

[获取当前进程信息 (os包)](http://www.cnblogs.com/vamei/archive/2012/10/12/2721016.html)

<a name="os.path" ></a>

## os.path 路径管理

- abspath
- split #return (path,file_name_tail)
- dirname #path
- basename #file_name_tail
- splitext #return (file_name,._tail)
- exists 
 
#### os.path 查询路径

os.path.basename(path)    # 查询路径中包含的文件名
os.path.dirname(path)     # 查询路径中包含的目录

info = os.path.split(path)       # 将路径分割成文件名和目录两个部分，放在一个表中返回
path2 = os.path.join('/', 'home', 'vamei', 'doc', 'file1.txt')  # 使用目录名和文件名构成一个路径字符串

p_list = [path, path2]
print(os.path.commonprefix(p_list))    # 查询多个路径的共同部分

os.path.normpath(path)   # 去除路径path中的冗余。比如'/home/vamei/../.'被转化为'/home'

 

#### os.path查询文件的相关信息(metadata)，比如文件类型，大小，修改时间。

import os.path
print(os.path.exists(path))    # 查询文件是否存在

print(os.path.getsize(path))   # 查询文件大小
print(os.path.getatime(path))  # 查询文件上一次读取的时间
print(os.path.getmtime(path))  # 查询文件上一次修改的时间

print(os.path.isfile(path))    # 路径是否指向常规文件
print(os.path.isdir(path))     # 路径是否指向目录文件

<a name="shutil" ></a>

## shutil: 文件操作工具

- copy(src, dst)

复制文件，从src到dst。相当于$cp命令。

- move(src, dst)

移动文件，从src到dst。相当于$mv命令。

<a name="re" ></a>

## re: 正则表达式regular expression

[@note-regular expression](regular-expression.md)

m = re.search(pattern, string)  # 搜索整个字符串，直到发现符合的子字符串。
m = re.match(pattern, string)   # 从头开始检查字符串是否符合正则表达式。必须从字符串的第一个字符开始就相符。
re.split()    # 根据正则表达式分割字符串， 将分割后的所有子字符串放在一个表(list)中返回
re.findall()  # 根据正则表达式搜索字符串，将所有符合的子字符串放在一给表(list)中返回
re.compile()

<a name="glob" ></a>

## glob: 正则表达式 on files

Pattern matching on files

	import glob
	glob.glob('*.txt')
	>>>['holy_grail.txt', 'junk.txt', 'newfile.txt']
	
<a name="pickle" ></a>
	
## pickle cPickle 存储对象

pickle: Useful to store arbitrary objects to a file. Not safe or fast!

	pickle.dump(var, file('test.pkl', 'w'))
	pickle.load(file('test.pkl'))	

cPickle coded by c, 1000 faster than pickle

	import cPickle as pickle
	with open(path, 'w') as f:                     # open file with write-mode
    picklestring = pickle.dump(obj, f)   # serialize and save object
    
    # define the class before unpickle
	class Bird(object):
    	have_feather = True
    	way_of_reproduction  = 'egg'

	with open(path, 'r') as f:
    	obj = pickle.load(f)   # read file and build object
    	
<a name="subprocess" ></a>
    	
## subprocess 运行外部程序: 实现shell

基于Popen()的封装(wrapper)

- subprocess.call()
父进程等待子进程完成
返回退出信息(returncode，相当于exit code，见Linux进程基础)
- subprocess.check_call()
父进程等待子进程完成
返回0
检查退出信息，如果returncode不为0，则举出错误subprocess.CalledProcessError，该对象包含有returncode属性，可用try...except...来检查(见Python错误处理)。
- subprocess.check_output()
父进程等待子进程完成
返回子进程向标准输出的输出结果
检查退出信息，如果returncode不为0，则举出错误subprocess.CalledProcessError，该对象包含有returncode属性和output属性，output属性为标准输出的输出结果，可用try...except...来检查


`import subprocess
out = subprocess.call("ls -l", shell=True)`

<a name="subprocess.Popen" ></a>

## subprocess.Popen shell式进程管理

shell

import subprocess
child = subprocess.Popen(["ping","-c","5","www.google.com"])
return_code = child.wait() # parent process wait child done
print("parent process")

- 子进程的PID存储在child.pid
- child.poll()           # 检查子进程状态
- child.kill()           # 终止子进程
- child.send_signal()    # 向子进程发送信号
- child.terminate()      # 终止子进程

#### 子进程的文本流控制

- child.stdin
- child.stdout
- child.stderr

import subprocess
child1 = subprocess.Popen(["ls","-l"], stdout=subprocess.PIPE)
child2 = subprocess.Popen(["wc"], stdin=child1.stdout,stdout=subprocess.PIPE)
out = child2.communicate()
print(out)

subprocess.PIPE实际上为文本流提供一个缓存区,直到communicate()方法从PIPE中读取出PIPE中的文本

communicate()是Popen对象的一个方法，该方法会阻塞父进程，直到子进程完成;communicate()方法来使用PIPE给子进程输入

import subprocess
child = subprocess.Popen(["cat"], stdin=subprocess.PIPE)
child.communicate("vamei")

<a name="signal" ></a>

## [signal](http://www.cnblogs.com/vamei/archive/2012/10/06/2712683.html)

#### 预设信号处理函数

	import signal
	def myHandler(signum, frame):
    	print('I received: ', signum)

	signal.signal(signal.SIGTSTP, myHandler) # register signal.SIGTSTP's handler 
	signal.pause() #signal.pause()来让该进程暂停以等待信号
	
<a name="thread and syc" ></a>
	
### [thread and syc](http://www.cnblogs.com/vamei/archive/2012/10/11/2720042.html)

	def booth(tid):
    	global lock
    	while True:
        lock.acquire()                # Lock; or wait if other thread is holding the lock
        #do something
        os._exit(0)              # Exit the whole process immediately
        lock.release()               # Unblock
        #other code

	# Start of the main function
	lock = threading.Lock()              # Lock (i.e., mutex)

	# Start 10 threads
	for k in range(10):
    	new_thread = threading.Thread(target=booth,args=(k,))   # Set up thread; target: the callable (function) to be run, args: the argument for the callable 
    	new_thread.start()              

threading.Thread

- start()
- run()
- join() 直接先后顺序 类pipe linux进程的wait

threading.Lock 类mutex

- acquire()
- release()

threading.Condition 类condition variable

- wait() 
- notify() 
- nitifyAll() 

threading.Semaphore 类semaphore

threading.Event 没有潜在的Lock保护的condition variable

<a name="multi process" ></a>

## multi process

api like [thread and syc] 

Process.PID中保存有PID

Queue与Pipe

- 在UNIX平台上，当某个进程终结之后，该进程需要被其父进程调用wait，否则进程成为僵尸进程(Zombie)。所以，有必要对每个Process对象调用join()方法 (实际上等同于wait)。对于多线程来说，由于只有一个进程，所以不存在此必要性。
- multiprocessing提供了threading包中没有的IPC(比如Pipe和Queue)，效率上更高。应优先考虑Pipe和Queue，避免使用Lock/Event/Semaphore/Condition等同步方式 (因为它们占据的不是用户进程的资源)。
- 多进程应该避免共享资源。在多线程中，我们可以比较容易地共享资源，比如使用全局变量或者传递参数。在多进程情况下，由于每个进程有自己独立的内存空间，以上方法并不合适。此时我们可以通过共享内存和Manager的方法来共享资源。但这样做提高了程序的复杂度，并因为同步的需要而降低了程序的效率。

#### 进程池

close()  进程池不再创建新的进程

join()   wait进程池中的全部进程。必须对Pool先调用close()方法才能join。

map(func,args) or apply_async(func,args) 

Manager  c/s进程

#### [共享内存](http://www.cnblogs.com/vamei/archive/2012/10/13/2722254.html)



