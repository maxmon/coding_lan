[guide](http://www.runoob.com/cplusplus/cpp-operators.html)

## 字符串处理

- strcat(des, sour) 将第二个字符串的一份**添加**到第一个字符串的结尾
- strlen 字符串长度
- strcpy(des, sour)将第二个字符串的一份**拷贝**到第一个字符串
- strcmp 比较两个字符串 str1<str2，则返回负数...
-  snprintf(char *str, size_t size, const char *format, ...) 将可变个参数(...)按照format格式化成字符串，然后将其复制到str中
- char *strstr( char *str, char * substr ); 返回字符串str中第一次出现子串substr的地址；如果没有检索到子串，则返回NULL
- char *strchr(const char *s,char c);查找字符串s中首次出现字符c的位置
- 


## var

- NULL
- 75u        // unsigned int
- 75l        // long
- 75ul       // unsigned long
- bool bar = false;
- int* p = nullptr;
- Logical operators ( !, &&, || )
- 7==5 ? 4 : 3   
- a = (b=3, b+2)
- bitwise operators ( &, |, ^, ~, <<, >> )
- 转型 i = (int) f; 	i = int (f);
- 函数 sizeof
- void duplicate (const string& a, int& b, int& c) vs void duplicate (int a, int b, int c)
- &	指针运算符 & 返回变量的地址。例如 &a; 将给出变量的实际地址。
- \*	指针运算符 * 指向一个变量。例如，*var; 将指向变量 var。
- 函数返回数组参数用指针
- if(!ptr)    /* ptr为指针，，如果 ptr 为空，则完成 */

C++ 中的类型限定符

类型限定符提供了变量的额外信息。

限定符	含义

const	const 类型的对象在程序执行期间不能被修改改变。

volatile	修饰符 volatile 告诉编译器，变量的值可能以程序未明确指定的方式被改变。

restrict	由 restrict 修饰的指针是唯一一种访问它所指向的对象的方式。只有 C99 增加了新的类型限定符 restrict。

extern 存储类用于提供一个全局变量的引用，全局变量对所有的程序文件都是可见


#### 引用很容易与指针混淆，它们之间有三个主要的不同：

- 不存在空引用。引用必须连接到一块合法的内存。
- 一旦引用被初始化为一个对象，就不能被指向到另一个对象。指针可以在任何时候指向到另一个对象。
- 引用必须在创建时被初始化。指针可以在任何时间被初始化。

## class

protected 成员变量或函数与私有成员十分相似，但有一点不同，保护成员在派生类（即子类）中是可访问的。

	class Box
	{
	   public:
	      double length;
	      void setWidth( double wid );
	      double getWidth( void );
	 
	   private:
	      double width;
	   
	   void setWidth(double wid)
	   {
	   		...
	   	}
	};
	 
	// 成员函数定义
	double Box::getWidth(void)
	{
	    return width ;
	}
	
	class SmallBox:Box // SmallBox 是派生类
	{
	   public:
	      void setSmallWidth( double wid );
	      double getSmallWidth( void );
	};
	
## struct union

	typedef union DataValue1
	{
	    int v_int;
	}DataValue1;
	typedef union DataValue2
	{
	    int v_int;
	}DataValue2;
	
	typedef struct DataNode
	{
	    DataType type;
	    union
		{
		DataValue1 val1;
		DataValue2 val2;	
		} info;
	}DataNode;
	
	DataNode* dn = NULL;
	...
	dn->info.val1.v_int
	
#### 查找

	brand_dict->catalog.find(scope.scope[i]) != brand_dict->catalog.end() // 找得到
## printf

- %s char* or string
- %d int
- %p 指针
- %c char
- %s &char_arr[0] or char_arr;  char数组 
- %s str.c_str(); string类型

