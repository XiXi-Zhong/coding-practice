#代表注释和思路
##代表的是程序执行结果

#第一步：生成1到6的一组整数
1:6  
##[1] 1 2 3 4 5 6
#如果想要多次使用这个结果，让计算机保存创建一个R对象（object）
die<- 1:6
die
##die
[1] 1 2 3 4 5 6
#想查看命名对象
ls()
##[1] "die"
die-1
##[1] 0 1 2 3 4 5
die/2
##[1] 0.5 1.0 1.5 2.0 2.5 3.0
die*die
##[1]  1  4  9 16 25 36
#R使用元素方式执行（element-wise execution）
#即对数字集中每个元素操作，加一就是每个元素加1
#涉及两个以上向量相乘，会一一对应操作。

#如果遇到两个向量长度不一样，短的向量重复，直到和长元素长度相同
die+1:2
die+1:4
#die+1:2
##[1] 2 4 4 6 6 8
##[1] 2 4 6 8 6 8
##警告信息:In die + 1:4 : 长的对象长度不是短的对象长度的整倍数
#%*%执行行内乘法，%o%执行外乘法
die%*%die
##die%*%die,内积 Inner Product
##[,1]
##[1,]   91
die%o%die
##外积（Outer Product）生成一个矩阵
##die%o%die
#[,1] [,2] [,3] [,4] [,5] [,6]
#[1,]    1    2    3    4    5    6
#[2,]    2    4    6    8   10   12
#[3,]    3    6    9   12   15   18
#[4,]    4    8   12   16   20   24
#[5,]    5   10   15   20   25   30
#[6,]    6   12   18   24   30   36

round(mean(die))
##从最内层开始计算，知道最外层，#round函数四舍五入
##[1] 4
sample(die,size=2)
#sample 默认不放回抽样，放回抽样才能保证实验相互独立
sample(x=die,size=2,replace=TRUE)
#创建独立随机样本，想要知道总点数
dice <- sample(x=die,size=2,replace=TRUE)
sum(dice)
dice
##反复调用dice,结果都相同，已经把值赋予dice，不会再随机变换
#编写自定义函数
#自定义函数效果：每次调用，都会返回两个骰子点数之和
#给自定义函数命名roll
roll <- function(){
  die <- 1:6
  dice <- sample(die,size = 2,replace =TRUE)
  sum(dice)}
roll()
roll

#练习绘制直方图,用ggplot函数(histogram)
x3 <- c(0,1,1,2,2,2,3,3,4)
## 将数据转换为数据框
df <- data.frame(x3)
#因为在ggplot函数里面，所有数据输入都要以 数据框（data.frame）
library(ggplot2)
ggplot(df,aes(x=x3))+geom_histogram(
  binwidth = 1,fill = "lightblue",
  color = "black", boundary = -0.5)
#在 ggplot2 中，aes() 用于定义数据映射，
#即将数据变量映射到图形属性（如 x 轴、y 轴、颜色、形状等）
library(ggplot2)
ggplot(df,aes(y=x3))+geom_histogram(
  binwidth = 1,fill = "lightblue",
  color = "black", boundary = -0.5)
#如果是y=x3，图像就是反的

#replicate函数重复执行你想要运行某代码次数
replicate(4,1+1)
##[1] 2 2 2 2
#运行10次，连续两次骰子和
replicate(10,roll())
#将1000次运行结果画成直方图
rolls <- replicate(1000,roll())
df_1 <- data.frame(rolls)
ggplot(df_1,aes(x=rolls))+geom_histogram(binwidth = 0.5,fill = "lightblue",
                color = "black", boundary = -0.5)

#结果是一个中间概率分布最大，两边概率分布下降的一个直方图
#证明这个随机过程是均匀的。无偏差的

?sample#查询sample函数用法
#改变骰子结果权重，构建新的点数和直方图
roll_1 <- function(){
  die <- 1:6
  dice_1 <- sample(die,size=2,replace=TRUE,prob = c(1/8,1/8,1/8,1/8,1/8,3/8))
  sum(dice_1)
}
roll_1()
rolls_1 <- replicate(1000,roll_1())
df_2 <- data.frame(rolls_1)
library(ggplot2)
ggplot(df_2,aes(x=rolls_1))+geom_histogram(binwidth = 0.5,fill = "blue",color = "black", boundary = -0.5)
#改变权重出现大点数概率更高


