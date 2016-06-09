##二师兄讲volly


volly = 队列 + cache图片（ 图片的效率 + 图片空间管理 ）

- 图片的效率
 - 存在一个bit数组 一个file key value 大文件地址 图片随机访问 start offset（减少索引时间）
- 图片原始数据 --> 转化成bitmap（ 解码后的数据，减少解码时间 ） --> 存入bit数组 

