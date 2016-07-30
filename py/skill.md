## path

sys.path # 查看当前的search path

## 查询

- dir()  module.__file__#查询一个类或者对象所有属性
- hasattr(obj, attr_name)   # attr_name是一个字符串
- getattr(obj, attr_name)
- help() some? #查询说明文档

## [下划线](http://python.jobbole.com/81129/)

- 在解释器中：在这种情况下，"_"代表交互式解释器会话中上一条执行的语句的结果
- "_"作为临时性的名称使用 (var_name/function_name/class_name/file_name)
	- `_name` API中非公开的部分
	- `__name` 防止子类覆盖 解释器自动改写为 `"_classname__name"`
	- `__name__` Python中特殊的方法名。通常，你将会覆写这些方法，并在里面实现你所需要的功能，以便Python调用它们

## `__some__` [magic method](http://pyzh.readthedocs.io/en/latest/python-magic-methods-guide.html)

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