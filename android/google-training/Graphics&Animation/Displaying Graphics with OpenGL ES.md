##[Building an OpenGL ES Environment](http://developer.android.com/training/graphics/opengl/environment.html)
###usage
- GLSurfaceView and GLSurfaceView.Renderer
	- fullscreen
- TextureView
	- incorporate with layout
###step
- declare manifest
- activity
- GLSurfaceview
- Render




##[Defining Shapes](http://developer.android.com/training/graphics/opengl/shapes.html)
定义坐标系

[0,0,0]=centre;[1,1,0]=top&right;[-1,-1,0]=bottom&left
###step
- difine vertex
	- include draw order
- use byteBuffer for efficiency

##[Drawing Shapes](http://developer.android.com/training/graphics/opengl/draw.html)
- GLSL code
	- Vertex Shader 
	- Fragment Shader
- Program
	- Compiling OpenGL ES shaders and linking programs is expensive;do it once
- define 图形类（contain logic） onDrawFrame绘制

