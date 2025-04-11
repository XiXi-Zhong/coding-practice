#生成原子型向量储存牌面
hand <- c("ace","king","queen","jack","ten")
hand
typeof(hand)#识别字符类型

#赋予属性，attribute（）函数可以查看属性
die <- c(1:6)
attributes(die)
#names die查看die对象的名称属性
names(die)
#赋予名称属性
names(die) <- c("one","two","three","four","five","six")
attributes(die)
die
## one   two three  four  five   six 
#1     2     3     4     5     6 
#想要一次性删除名称属性，将NULL赋予names函数
names(die) <- NULL
die

#2,维度属性
dim(die) <- c(2,3)#将向量组织成一个2X3矩阵
die
##   [,1] [,2] [,3]
##[1,]    1    3    5
##[2,]    2    4    6

#3矩阵matrix
m <- matrix(die,nrow=2)#形成2行矩阵
m
