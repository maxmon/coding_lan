## `__dict__`

class的 `__dict__ `是只读的.example: `class O:pass` `O.__dict__` 是一个 dictproxy 对象，而不是一个 dict，没有`__setitem__`。设置属性用 `setattr(O, "a", 1)`

## bound method / unbound method

bound method 就是绑定了一个实例的方法， 否则叫做 unbound method .它们都是方法(method), 是出现在 class 中的函数

```
>>> class C(object):
...     def foo(self):
...         pass
...
>>> C.foo
<unbound method C.foo>
>>> C().foo
<bound method C.foo of <__main__.C object at 0xb76ddcac>>
>>>
```

## new style class 和 old style class

Python为了提供一个更完整的元模型。Python中很神奇的描述器只能在新式类里用

新式类是继承自 object 或其他新式类的类:

```
class NewStyleClass(object):
    pass

class AnotherNewStyleClass(NewStyleClass):
    pass
```

否则是老式类:

```
class OldStyleClass():
    pass
```

## Attempted relative import in non-package

不能在一个包里运行一个脚本文件，顶层的脚本文件不能用相对导入

如果要将一个包作为一个脚本运行的话，需要将运行的脚本文件更名为`__main__.py`，然后再该包文件夹外运行该包的命令:`python -m testpackage`

## map操作 `cPickle.PicklingError: Can't pickle <type 'function'>: attribute lookup __builtin__.function failed`

map操作需要将函数序列化,cpickle不能序列化 class的method(or lambda method),只能序列化function

# os.rename vs shutil.move

os.rename是按shell的`mv`实现的： os.rename(f1,f2)的操作是 `f1 -> del f1 to some buff -> create new f2`在多进程的io下会有buff被冲突

即**os.remove(del)也是延迟缓冲类的操作**，os.remove 到重新写入很快是，会出现 `file_时间`的冲突文件

#### **多进程下的文件写操作 **

cp、rename、(remove) @`shutil.copyfile shutil.move shutil.rmtree `**

其它创建文件、文件夹 不要多进程下执行