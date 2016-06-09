menu 在android 3.0以上不可用
##物理概念
[中文翻译google API 图形系统](http://blog.csdn.net/niu_gao/article/details/7405504)
###drawable

可画对象 的抽象

拥有 画笔

###paint

画笔 的抽象

###bitmap 

区域 的抽象，由系统控制
###canvas 

画布，待绘画的区域的绘制对象能力 的抽象，总是需要一个bitmap

##特性

###离屏缓冲

###硬件加速


##tool

- Hierarchy View - layout tree
- DDMS
- draw9patch
- layoutopt - xml 优化
- Android Asset Studio - adt插件，上传的图像转变为指定分辨率的版本
- monkey - test 

##layout

- tablelayout
	- 表格数据
- gridlayout
	- android4.0
	- 低层次的relativelayout
- space - 空间view

###<viewstub />

默认隐藏的 <include />，带view显隐属性

##loader 

- android3.0

[中文翻译google的loaders](http://blog.csdn.net/niu_gao/article/details/7249802)

##activity

###stack

task = activity stack

有foreground background两种状态

###state

- oncreate
	- 设置布局
	- 视图数据
	- 初始化线程
- onpause
	- 保存用户期望保存的输入数据（如edittext）
	- 前台切后台时第一个触发

###onSaveInstanceState

activity创建/销毁相关  

典型应用 处理配置更改 横屏竖屏

##fragment

###fragment & activity

- activity
	- fragment
	
	- onAttach
	- onCreate
	- onCreateView
- onCreate
	- onActivityCreated
- onStart
	- onStart同时
- onResume
	- onResume同时
- onPause
	- onPause同时
- onStop
	- onStop同时
- onDestroy
	- onDestroyView
	- onDestroy
	- onDetach

##menu

android4.0 

- `<android:uiOption/>`
- `<android:actionViewClass/>`
- ActionProvider 

##view

invalidate (ui thread) & postInvalidate(other thread)

##animation

>应用于视图的动画框架

###AnimationDrawable

###四种Animation-视图动画

>应用于任何对象的动画框架

###property animation

*Android3.0*

- ValueAnimator
- AnimatorSet
- xml
-  ViewPropertyAnimator
	- 只处理视图和常见的视图属性时考虑它，more cleaner
-  LayoutTransition
	- viewgroup中添加/删除 动画
	- `android:animateLayoutChanges`
##图形系统

所有绘图操作都发生在UI thread上

or use SurfaceView

###两个阶段

- 递归测量（父->子->子）
- 递归绘制（父->子->子）

##自定义view（simple 2D view）

###construction

>context

应用资源和系统服务接口

>AttributeSet

xml参数

###onMeasure

MeasureSpecs = mode + int

mode

- UNSPECIFIED 子视图任意尺寸
- AT_MOST 小于等于  MeasureSpecs
- EXACTLY 等于 MeasureSpecs

###绘制原语
painter 
####*Inner Class*

`class="com.....ParentView$InnerView"`

###属性
####xml中定义
	<resources>
		<declare-styleable name="test1">
			<attr name="android:color"/>
			<attr name="rotation" format="String">
		</declare-styleable name="test1">
	</resources>

预设值

>enum

	<attr name="test2">
	<enum name="value1" value="1" />
	</attr>

>flag 可用 | or逻辑

	<attr name="test3">
	<flag name="flag1" value="0x01" />
	<flag name="flag2" value="0x02" />
	</attr>

调用

- 添加xml命名空间属性
- `<com.... viewA:test3="flag1|flag2" viewA:test1="30aa"
 />`

####use in code

in constructor

	TypedArray arr = getContext().obtainStyledAttributes(attrs, R.styleable.xmlfile)
	//get attribution arguments
	//arr.getFload(R.styleable.viewaa_test1)
	arr.recycle()
##创建复合组件

1. in constructor 
	View view =  ((LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE)).inflate(R....,this)
2. view 直接实现组件的接口
表现为新组合的view对外的**能力**

3. 查看view tree； use merge

##SurfaceView

1. in constructor 
	- new drawing thread
	- mSurfaceHolder = getHolder();
	- mSurfaceHolder.addCallback(this);
	- other init
1. define drawing thread 

		private class DrawingThread extends Thread {
			boolean keepRunning = true;

			public void run() {
				Canvas c;
				while(keepRunning) {
					c= null;
					try {
						c = mSufaceHolder.lockCanvas();
						sychronized (mSurfaceHolder) {
							//...logic code
							onDraw(c);
						}
					} finally {
						if(c != null) mSurfaceHolder.unlockCanvasAndPost(c);
					}

					try {
						Thread.sleep(20);
					} cathc (InterrupedException e) {}
				}
			} 
		}	

-  implements Surface.Callback
	- surfaceCreated //start drawing thread
		
		`mThread.keepRunning = true;
		mThread.start();`
	- surfaceDestroyed //clean
	
`mThread.keepRunning = true;
boolean retry = true;
while(retry) {
	try {
		mThread.join();
		retry = false;
	} catch (InterruptedException e) {}
}

4. onDraw canvas draw things

###comment

绘图移动到单独的线程

存在于常规视图系统之外，不能像常规视图系统被移动、缩放、alpha

##TextureView

*Android4.0*

支持常规视图系统API的Surfaceview

需要硬件加速，对性能要求不高
###e.g.

全屏游戏 no

开发高性能canvas视图 yes

摄像头预览等内容流 yes

##RenderScript
架构独立，使用简单C语法，提供高性能运算API
##OpenGL
	- 

