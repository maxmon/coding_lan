- <a href="#特殊方法与多范式">内置函数</a>
- <a href="#上下文管理器">上下文管理器： with...as...的本质</a>
- <a href="#对象属性">对象属性</a>
- <a href="#闭包">闭包</a>
- <a href="#装饰器">装饰器(decorator)</a>
- <a href="#内存">内存</a>
- <a href="#垃圾回收">垃圾回收</a>

<a name="特殊方法与多范式" ></a>

## 内置函数

定义了__init__()方法的类，会在创建对象的时候自动执行__init__()方法中的操作

- 运算符： 对应特定方法的调用
	- 'abc' + 'xyz'  'abc'.__add__('xyz') #两个对象是否能进行加法运算，首先就要看相应的对象是否有__add__()方法
	- (1.8).__mul__(2.0)
	- True.__or__(False)

- 一些内置函数
	- len([1,2,3]) [1,2,3].__len__()
	- (-1).__abs__()
	- (2.3).__int__()
	- li[3] li.__getitem__(3)
	
**函数也是一种对象。任何一个有__call__()特殊方法的对象都被当作是函数**

class SampleMore(object):
    def __call__(self, some_arg):
        #some code

<a name="上下文管理器" ></a>

## [上下文管理器](http://www.cnblogs.com/vamei/archive/2012/11/23/2772445.html)： with...as...的本质

规定了文件对象f的使用范围

	class VOW():
    	def __init__(self):
        	print 'init'
    	def __enter__(self):
        	print 'enter'    
        	return self     #__enter__()返回一个对象。上下文管理器会使用这一对象作为as所指的变量
    	def __exit__(self,exc_type,exc_value,traceback):
        	print 'exit'         # exc_type, exc_value, traceback用于描述异常。正常运行结束，这三个参数都是None

	with VOW() as myvow:
    	print('inside')
	print('done')
	
<a name="对象属性" ></a>

## 对象属性

继承 `class bird(object) ` 逐层向上查属性 obj.__dict__ 分层存储属性，只存储该层新增的属性 __class__属性找到对象的类，然后调用类的__base__属性来查询父类

_getattr__(self, name)来查询即时生成的属性

<a name="闭包" ></a>

## 闭包

一个函数和它的环境变量合在一起，就构成了一个闭包(closure) 

环境变量取值被保存在函数对象的__closure__属性 __closure__里包含了一个元组(tuple)。这个元组中的每个元素是cell类型的对象

利用闭包，我们实际上创建了泛函;一些逻辑结构已定，一些环境参数待定

闭包(closure)是函数式编程的重要的语法结构。函数式编程是一种编程范式 (而面向过程编程和面向对象编程也都是编程范式)。在面向过程编程中，我们见到过函数(function)；在面向对象编程中，我们见过对象(object)。**函数和对象的根本目的是以某种逻辑方式组织代码**，并提高代码的可重复使用性(reusability)。闭包也是一种组织代码的结构，它同样提高了代码的可重复使用性。

	def line_conf():
    	b = 15 #b为line的环境变量,line作为line_conf的返回值时，line中已经包括b的取值(尽管b并不隶属于line)
    	def line(x):
        	return 2*x+b
    	return line       # return a function object


在并行运算的环境下，我们可以让每台电脑负责一个函数，然后将一台电脑的输出和下一台电脑的输入串联起来。最终，我们像流水线一样工作，从串联的电脑集群一端输入数据，从另一端输出数据。这样的情境最适合只有一个参数输入的函数。闭包就可以实现这一目的。

<a name="装饰器" ></a>

## [装饰器(decorator)](http://www.cnblogs.com/vamei/archive/2013/02/16/2820212.html)

pass

<a name="内存" ></a>

## 内存

`id(obj) 1# return obj-addr`

`obj1 is obj2 ` or `id(obj1) == id(obj2)`

<a name="垃圾回收" ></a>

### [垃圾回收](http://www.cnblogs.com/vamei/p/3232088.html)

- 计数为0
- 分代回收 一些对象长期被使用，减少在垃圾回收中扫描它们的频率
   