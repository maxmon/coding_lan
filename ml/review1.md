## 线性的模型拟合！=特征本身是线性的含义

线性的模型拟合！=特征本身是线性的含义（如：某个f的平方做特征输入）；所以在f的plot上一样存在过拟合问题

## bias

neural bias:信号的角度，整体units激活（非零）；这样单个激活的影响不会过（ develop strong weights to these correlated inputs the bias will lower the energy of their off state when the feature that detects them all being on — is off）

Let's say that there are a hundred input nodes that always follow each other, how should the network encode that?

What happens is that some hidden nodes develop strong weights to these correlated inputs. When most of them are on, it's on, which creates a low energy state whereby all of the inputs are on.

Conversely, let's say that a single input node is always on, how should the network encode that?

In that case, no hidden node is enlisted, but the bias term acts a hidden node that is always on. It will reduce the energy of this input node being in the on state. Similarly, if an input node is usually off, the bias can encode that.

Finally, in our first example with the hundred inputs that always follow each other: there is no need to create a feature that turns on when these inputs are all off because the bias will lower the energy of their off state when the feature that detects them all being on — is off.

## 调试模型，过/欠拟合

选择f的三角展开最佳degree，需要加入cv训练集；选择最佳regularization theta同；就是把模型参数theta和过拟合欠拟合参数用的数据集分开

## 分类器的评估

正确率 tp + tn / (tp + tn + fp + fn)

precision tp/tp+fp 异常集合（在预测为1的总量中预测1的正确率）

recall tp/tp + tn（在预测为成功的总量中预测1的正确率）

f1 score : p*r/(p+r)

## 推荐优化路径

快速模型
learning curve
metrics分析

## k-mean

循环{k个中心，求mean，mean为中心}
cost = MSE mean{(y-y)^2}
选择k：k-cost plot找拐点
收敛于局部最小》》》》》二分K－mean

## PCA/SVD

降维，去噪，加速训练，降低数据存储
not for处理过拟合（NG不推荐）

PCA是在训练完成后并不理想的后手，不是先手（NG）

## anomaly detection

正反比例不均==》高斯核映射x；

## 计算香农熵

当前（label的）数据集的香农熵：根据label下样本数得p 计算每个label的－p*log(p,2)

## 词集和词袋 特征模型

恶意留言的例子用setOfWords2Vec，以词的出现否作为特征
而垃圾邮件以词的出现次数作为特征

## bayes

朴素bayes，假定特征独立：条件概率＝分量条件概率的乘积

## 补均值，由业务决定

补均值：带有倾向步
忽略缺失值样本
相似样本的均值
另外的算法预测均值

## 模型融合bagging boosting

@notebook

陪审团理论：每个分类器大概率预测成功（正确率 > .5）有差异性的弱分类器集体投票，融合的成绩更优

bagging 》》 即训练多个分类器，每个分类器只用到训练数据中随机的一部分信息，然后各个分类器把结果汇总;;;;eg.随机重复抽样S个样本集，训练S个分类器，投票

boosting 》》 Adaboost 泛化错误率低；对离群点敏感
多个分类器组合，分类器权重不相等D（由公式（训练的errors）得到）；不断强化错误集权重，让后续的分类器更加关注错误集的训练；最终按 权重D[alpha]*对应的分类器结果 classify，收敛errorRate

random forest========

each decision-tree：在样本set的子集train，在随机的feature subset中选择一个最优feature split（熵下降最快）；每个tree的bias略微增加，整体average以后variance降低；这一优点补偿了单个tree的bias增加，整体提升

adaboosting======

data / classification都有weight；每个boosting 根据error调整data的w出eight，进而计算classification的weight
不断让后续的分类器关注错误集


随机森林：利用在特征的子集分裂节点导致的决策树的明显差异性特性 + bagging 投票

## 频繁项 关联规则

找频繁项，by 支持度support：num(a | b) / m
找关联规则，by 可信度confidence a->b: support(a | b) / support(a)

apriori找频繁集：频繁的子集也频繁；非频繁的超集也非频繁
不满足关联规则项的子集项也不会满足

## 相似度计算

欧式距离
皮尔逊相关系数（协方差）
余弦相似度，两向量夹角

## 检验两分布

t-test（假定了高斯分布）
算互信息（相关的信息量）（vs自信息，比较）

## 聚类和协同

协同过滤》》 X和theta基于同一特征n，同时梯度X和theta，补足R矩阵。X，y都沿特征k展开

聚类是各个样本往若干个共同中心聚合的过程
协同过滤是尽量在样本中构造平行相似性，以弥合缺失的样本信息维度

结合knn找相似用户去投票喜欢否

微博用户兴趣推荐，首先使用聚类方法对人群进行若干大类的划分，然后在一类人群中进行协同过滤推荐。这样比全局进行协同过滤效果会好，因为这个思路首先承认了不同的人群的兴趣爱好是迥异而有模式的

## 简单推荐

对于每个用户，缺失的商品估计分数（协同过滤估计 or rating * 相似度的权值（求各个商品打分*相似度的概率） or （聚类+，提高运算速度）knn投票）

## 数据归一化

数据预处理中，标准的第一步是数据归一化。

- 简单缩放；；；我们的目的是通过对数据的每一个维度的值进行重新调节（这些维度可能是相互独立的）
- 逐样本均值消减(也称为移除直流分量)；；如果你的数据是平稳的（即数据每一个维度的统计都服从相同分布），那么你可以考虑在每个样本上减去数据的统计平均值(逐样本计算)
- 特征标准化(使数据集中所有特征都具有零均值和单位方差)；；；；特征标准化指的是（独立地）使得数据的每一个维度具有零均值和单位方差。这是归一化中最常见的方法并被广泛地使用（例如，在使用支持向量机（SVM）时，特征标准化常被建议用作预处理的一部分）


## feature engineering

new feature：数学化某种内在联系、新的辨别类别（挖掘出某种分界）

## hadoop hdfs

map <k,v> reduce <k2,v2> + config

## python ipc

pip messagequeue
