## package工程目录结构

```
.sub_package/*
```

```
.tests/*
.tests/data/*
...
```

```
.images/*
```

```
.data/*
```

```
.descr/*.rst
```

```
._some_so.so
```

```
__init.py__

# SomeClass需要声明import some_func不是必需
from .package import SomeClassA, SomeClassB
from .file import SomeClassC, [some_func]
#set()

__version__ = "0.7.0"

__all__ = ['SomeClassA',
           'some_func',
           ...]
```

           
## (package)工程文件

package的py不能使用`__main__`，需在tests写测试代码

```
from . import some_func
from . import _some_so.so
from .. import some_func, SomeClass

from abc import ABCMeta, abstractmethod

__all__ = ['SomeClass',
           'some_func',
           'URL']
__author__ = 'who'
__version__ = '1.5.2'
           
URL = ('http://archive.ics.uci.edu/ml/'
       'machine-learning-databases/covtype/covtype.data.gz')
_EPSILON = np.spacing(1)

logger = logging.getLogger()

try:
    from urllib2 import urlopen
except ImportError:
    from urllib.request import urlopen

try:
    import urllib.request as urllib  # for backwards compatibility
except ImportError:
    import urllib

class Child(six.with_metaclass(ABCMeta, Parent)):
	"""Some doc"""
	@abstractmethod
	def _get_support_mask(self):
	
	def get_support(self, indices=False):
		pass
		
	@classmethod
	def get_support2(indices=False)

###############################################################################
# brife doc	
def _some_fuc():
	"""Some doc"""
	pass	

```

## some_func or SomeClass

是否需要持有变量/常量