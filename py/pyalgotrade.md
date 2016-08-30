
## feed

barfeed -> bar parser -> bars -> bardataseries( => SequenceDataSeries => DataSeries)

自定制的BarFeed 多参考@GenericBarFeed/GenericRowParser in csvfeed.py

- bards.py
	- BarDataSeries时间数据序列，`__init__`定制长度
	- 在回测过程中不断append
	- @collections.ListDeque
