##多个fragment在一个view上加载

应需求，在一个view V上add多个fragment A,B,C;管理方式为hide pre ，show now， commit；； 

使用hide show管理，会出现点击响应问题；因为pre fragment和view在被hide之后没有分离（detach），在now被show之后，pre的fragment也被show了，只不过z轴低于now的fragment，没有看出来，但是对应的child view 的listener已经生效

- hide-show保留用户在view的操作状态
	- hide-show的本质是改变Z轴value；hidden的fragment依然可以相应点击；可以将fragment onreateView中的layoutview设置为clickable [见stackflow](http://stackoverflow.com/questions/10389620/fragment-over-another-fragment-issue)
- attach-detach销毁布局，不销毁实例
