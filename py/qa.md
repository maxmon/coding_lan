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

