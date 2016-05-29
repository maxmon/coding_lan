- <a href="#常用方法">常用方法</a>
	- <a href="#math">math</a>
	- <a href="#data plot">data plot</a>
	- <a href="#logic">logic</a>
	- <a href="#sort">sort</a>
	- <a href="#I/O">I/O</a>
	- <a href="#linear algebra">linear algebra</a>
	- <a href="#Random number generation">Random number generation</a>
- <a href="#matrix">matrix</a>
- <a href="#array">array</a>


用python实现高效的数值计算，NumPy，会把类似矩阵乘法这样的复杂运算使用其他外部语言实现。

从外部计算切换回Python的每一个操作，仍然是一个很大的开销。如果用GPU来进行外部计算，这样的开销会更大。用分布式的计算方式，也会花费更多的资源用来传输数据

<a name="常用方法" ></a>

## 常用方法

row axis=1 col axis=0

- np.random.randn(2, 3)  np.empty(10) np.ones(3) np.zeros(10) np.zeros((10,10)) np.eye(10)
- arr.shape arr.dtype arr.shape arr.ndim
- np.array(python_array)
- np.arange(15) np.arange(32).reshape((8, 4)) np.arange(-5, 5, 0.01) # 1000 equally spaced points
- arr.astype(np.float64) np.int32 np.string_ #convert dtype
- np_arr.copy() #copy arr or sub
- arr.min() arr.max()


feature

- Boolean indexing:  data[names == 'Bob']; data[-(names == 'Bob')]; data[names == 'Bob', 2:]; mask = (names == 'Bob') | (names == 'Will')
- Fancy indexing: arr[row_arr, clo_arr][row_order_arr, col_order_arr]  arr[np.ix_(row_with_order_arr, col_with_order_arr)]

<a name="math" ></a>

#### math

- np.allclose(A,B,equal_nan=True) #误差内相等e.g.:
- np.sqrt(arr)
- np.exp(arr)
- np.maximum(arr_A, arr_B)
- np.modf(arr) # return two arr_values
- arr.mean() np.mean(arr) arr.sum() 
- arr.mean(axis=1) #row mean arr.sum(axis=0) # col sum
- arr.cumsum(0) arr.cumprod(1) #累加 累乘
- inf # 无穷

<a name="data plot" ></a>

#### data plot

- np.meshgrid(points, points)

<a name="logic" ></a>

#### logic

- np.where(cond, xarr, yarr) # xarr_item if cond_item else yarr_item #@http://docs.scipy.org/doc/numpy/reference/generated/numpy.where.html
- x_arr_pos_index = np.where( x_arr > 0 )
- bool_arr.any() bool_arr.all()

unique and set logic

- np.unique(arr) 
- np.set(arr)
- np.all() np.any() # 尽量不要用pandas的obj.any()和all
- np.in1d(values, [2, 3, 6]) #check values array items equal 2 or 3 or 6

<a name="sort" ></a>

#### sort

sort 最值有np.max(),np.min() 他们都有axis和out（输出）参数, 而通过np.argmax(), np.argmin()可以得到取得最大或最小值时的 下标。排序通过np.sort(), 而np.argsort()得到的是排序后的数据原来位置的下标

- arr.sort(0)#axis=0

<a name="I/O" ></a>

#### I/O

- np.save('some_array', arr) np.load('some_array.npy')
- np.savez('array_archive.npz', a=arr, b=arr) arch = np.load('array_archive.npz') arch['b']
- !rm some_array.npy
- arr = np.loadtxt('array_ex.txt', delimiter=',')

<a name="linear algebra" ></a>

#### linear algebra

- arr.T #Transposing arrays 
- np.dot #矩阵内积 equal arr_x.dot(arr_y)
- inv(arr)
- q, r = qr(mat)

<a name="Random number generation" ></a>

#### Random number generation

- np.random.seed # 指定随机数种子
- np.random.normal( mean, stdev, size=arr.shape ) :给出均值为mean,标准差为stdev的高斯随机数(场)
- np.random.standard_normal(arr.shape)
- [normalvariate(0, 1) for _ in xrange(N)]
- np.random.randint(0, 2, size=nsteps)
- np.argmax(arr, axis=1) # the max_item index

<a name="matrix" ></a>

## matrix

mat(arr-like) 

python 的list是[item1,item2,..] numpy的是[[item..]... ]的形式

- matrix.T transpose：返回矩阵的转置矩阵
- matrix.H hermitian (conjugate) transpose：返回复数矩阵的共轭元素矩阵
- matrix.I inverse：返回矩阵的逆矩阵
- matrix.A base array：返回矩阵基于的数组

矩阵对象的方法：

- all([axis, out]) :沿给定的轴判断矩阵所有元素是否为真(非0即为真)
- any([axis, out]) :沿给定轴的方向判断矩阵元素是否为真，只要一个元素为真则为真。
- argmax([axis, out]) :沿给定轴的方向返回最大元素的索引（最大元素的位置）.
- argmin([axis, out]): 沿给定轴的方向返回最小元素的索引（最小元素的位置）
- argsort([axis, kind, order]) :返回排序后的索引矩阵
- astype(dtype[, order, casting, subok, copy]):将该矩阵数据复制，且数据类型为指定的数据类型
- byteswap(inplace) Swap the bytes of the array elements
- choose(choices[, out, mode]) :根据给定的索引得到一个新的数据矩阵（索引从choices给定）
- clip(a_min, a_max[, out]) :返回新的矩阵，比给定元素大的元素为a_max，小的为a_min
- compress(condition[, axis, out]) :返回满足条件的矩阵
- conj() :返回复数的共轭复数
- conjugate() :返回所有复数的共轭复数元素
- copy([order]) :复制一个矩阵并赋给另外一个对象，b=a.copy()
- cumprod([axis, dtype, out]) :返回沿指定轴的元素累积矩阵
- cumsum([axis, dtype, out]) :返回沿指定轴的元素累积和矩阵
- diagonal([offset, axis1, axis2]) :返回矩阵中对角线的数据
- dot(b[, out]) :两个矩阵的点乘
- dump(file) :将矩阵存储为指定文件,可以通过pickle.loads()或者numpy.loads()如:a.dump(‘d:\\a.txt’)
- dumps() :将矩阵的数据转存为字符串.
- fill(value) :将矩阵中的所有元素填充为指定的value
- flatten([order]) :将矩阵转化为一个一维的形式，但是还是matrix对象
- getA() :返回自己，但是作为ndarray返回
- getA1()：返回一个扁平（一维）的数组（ndarray）
- getH() :返回自身的共轭复数转置矩阵
- getI() :返回本身的逆矩阵
- getT() :返回本身的转置矩阵
- max([axis, out]) ：返回指定轴的最大值
- mean([axis, dtype, out]) :沿给定轴方向，返回其均值
- min([axis, out]) ：返回指定轴的最小值
- nonzero() :返回非零元素的索引矩阵
- prod([axis, dtype, out]) :返回指定轴方型上，矩阵元素的乘积.
- ptp([axis, out]) :返回指定轴方向的最大值减去最小值.
- put(indices, values[, mode]) :用给定的value替换矩阵本身给定索引（indices）位置的值
- ravel([order]) :返回一个数组，该数组是一维数组或平数组
- repeat(repeats[, axis]) :重复矩阵中的元素，可以沿指定轴方向重复矩阵元素，repeats为重复次数
- reshape(shape[, order]) :改变矩阵的大小,如：reshape([2,3])
- resize(new_shape[, refcheck]) :改变该数据的尺寸大小
- round([decimals, out]) :返回指定精度后的矩阵，指定的位数采用四舍五入，若为1，则保留一位小数
- searchsorted(v[, side, sorter]) :搜索V在矩阵中的索引位置
- sort([axis, kind, order]) :对矩阵进行排序或者按轴的方向进行排序
- squeeze([axis]) :移除长度为1的轴
- std([axis, dtype, out, ddof]) :沿指定轴的方向，返回元素的标准差.
- sum([axis, dtype, out]) ：沿指定轴的方向，返回其元素的总和
- swapaxes(axis1, axis2):交换两个轴方向上的数据.
- take(indices[, axis, out, mode]) :提取指定索引位置的数据,并以一维数组或者矩阵返回(主要取决axis)
- tofile(fid[, sep, format]) :将矩阵中的数据以二进制写入到文件
- tolist() :将矩阵转化为列表形式
- tostring([order]):将矩阵转化为python的字符串.
- trace([offset, axis1, axis2, dtype, out]):返回对角线元素之和
- transpose(*axes) :返回矩阵的转置矩阵，不改变原有矩阵
- var([axis, dtype, out, ddof]) ：沿指定轴方向，返回矩阵元素的方差
- view([dtype, type]) :生成一个相同数据，但是类型为指定新类型的矩阵。

<a name="array" ></a>

## array

array(arr-like)

- arr.size 






