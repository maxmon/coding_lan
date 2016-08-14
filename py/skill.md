## 参考

- [Python的隐藏特性(StackOverflow)](http://pyzh.readthedocs.io/en/latest/python-hidden-features.html)


## list

```
for i, e in enumerate(array)
zeroes = [0] * 100
nans = ('nan',) * 6
spaces = 100 * " "

#想要生成一个长链表但是并不想把它立刻存在内存
for i in xrange(1000000000):
```

## dict

dict轮训keys的速度比list快的多

## print 

```
# Python2.7
print >> sys.stderr, "this is an error message"

print >>  file("myfile", "w"), "hello world"
```

## exception

```
class MyException:
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return `self.value`
```

## path

sys.path # 查看当前的search path

## [自省](http://www.cnblogs.com/huxi/archive/2011/01/02/1924317.html)

- help() some? #查询说明文档
- `__dict__`所有属性键值对
- vars() 返回 `__dict__` 对象属性

```
for property, value in vars(theObject).iteritems():
    print property, ": ", value

import inspect
>>> for attr, value in inspect.getmembers(obj):
...     print attr, value
```
inspect.getmembers 返回的是元组 (attrname, value) 的列表。而且是所有的属性, 包括 `__class__ , __doc__ , __dict__ , __init__ `等特殊命名的属性和方法。而 vars() 只返回 `__dict__`


## [下划线](http://python.jobbole.com/81129/)

- 在解释器中：在这种情况下，"_"代表交互式解释器会话中上一条执行的语句的结果
- "_"作为临时性的名称使用 (var_name/function_name/class_name/file_name)
	- `_name` API中非公开的部分
	- `__name` 防止子类覆盖 解释器自动改写为 `"_classname__name"`
	- `__name__` Python中特殊的方法名。通常，你将会覆写这些方法，并在里面实现你所需要的功能，以便Python调用它们

## 推导式

```
results = [(x, y)
           for x in range(10)
           for y in range(10)
           if x + y == 5
           if x > y]
```

## magic method 

`__some__` 操作符重载 自省

[magic method1](http://pyzh.readthedocs.io/en/latest/python-magic-methods-guide.html)

[magic method2](http://www.cnblogs.com/huxi/archive/2011/01/02/1924317.html)
## 断言 

assert condition

仅用做防御型的编程，确保按约定进行设计

## @装饰器

@property

```
 	 @property
 	 @deprecated("``residues_`` is deprecated")
    def birth(self):
        return self._birth

    @birth.setter
    def birth(self, value):
        self._birth = value
```

```
from abc import ABCMeta, abstractmethod
...
class ...

	@abstractmethod
	@classmethod 
	@raises(ValueError)
	def some_func():
		pass
```

## dict default

```
val = dct.get(key, def_val)
sum[value] = sum.get(value, 0) + 1

val = dct.setdefault(key, def_val)
dct = defaultdict(list)
```

## list 步长与反转

```
>>> a = [1, 2, 3, 4, 5]
>>> a[::2]
[1, 3, 5]
>>> a[::-1]
[5, 4, 3, 2, 1]
```

## for else

else 语句块会在循环结束后执行，除非在循环块中执行 break

```
for i in (1, 3, 5):
...     if i % 2 == 0:
...         break
... else:
...     print "var i is always an odd"
```

## tree

```
def tree(): return defaultdict(tree)
```

## counter py2.7 np.unique

```
>>> from collections import Counter
>>> d = [1, 1, 1, 2, 2, 3, 1, 1]
>>> Counter(d)
Counter({1: 5, 2: 2, 3: 1})

>>> counter = Counter()
... for _ in range(10):
...     num = int(raw_input("Enter a number: "))
...     counter.update([num])
...
... for key, value in counter.iteritems():
...     print "You have entered {}, {} times!".format(key, value)
```

## 链式比较

```
1 < x < 5
```

## Python解释器中的”_”

```
>>> range(4)
[0, 1, 2, 3]
>>> _
[0, 1, 2, 3]
```
_ 即Python解释器上一次返回的值

## try/except/else

```
try:
  put_4000000000_volts_through_it(parrot)
except Voom:
  print "'E's pining!"
else:
  print "This parrot is no more!"
finally:
  end_sketch()
```

## zen

`import this`

## 用切片来删除序列的某一段

```
>>> a = [1, 2, 3, 4, 5, 6, 7]
>>> a[1:4] = []
>>> a
[1, 5, 6, 7]
当然用 del a[1:4] 也是可以的
```

## isinstance可以接收一个元组

```
>>> isinstance(1, (float, int))
```

## 显式的声明一个集合

```
>>> set([1,2,3])
# 在Python 2.7 之后可以这么写了:
>>> {1,2,3}
```

## and or

```
 m_var = var or def_var
```
