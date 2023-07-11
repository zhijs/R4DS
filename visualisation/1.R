library(tidyverse)


# tidyverse 集合了 ggplot2 tibble tidyr readr 常用包的集合包

# 设置目录
setwd('/public/home/yangzhi/project/bioinformation/R4ds/visualisation')

# mpg: 汽车燃料消耗数据集，ggplot2 自带的数据集,是一个 dataframe 数据集，其中 displ 列 表示引擎大小， hwy 列表示燃料效率
# 1. ggplot(data = datafram) 使用数据集创建一个空的图
# 2. geom_point() 增加一个点的层

# p = ggplot(data = mpg)

############ test1 #############
# 注意 + 号必须要在行的末尾
# p = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy))

################################

# 展示数据集说明： print(?mpg)
print(mpg)

############ test2 ###################
# p1. 按照 class 列的属性值给每个点不同的颜色 color
# p2. 按照 class 列的属性值给每个点不同的 size
# p3. 按照 class 列的属性值给每个点不同的透明度 alpha
# p4. 按照 class 列的属性值给每个点不同的形状 shape, 默认情况下最多六种形状，多余的将会被丢弃不画
# p5. 对 point 设置指定的颜色
############ plot data with color#####

# p1 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy, color=class))

# p2 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy, size=class))

# p3 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy, alpha=class))


# p4 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy, shape=class))


# p5 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy), color='blue')


# p6 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy), color='blue', size=xx(mm), shape=1(number))
######################################


############## excercise ####################
# p7
# p8: 按照 class 列的数据，分别画不同的子图，并展示在 2 行上
# p9: 按照 drv 和 cyl 的值，划分不同的子图
# p10: 划分子图不按照行列排步(排一行)
# p11: 排一列


# p7 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy,  color='blue'))

# p8 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) +
#   facet_wrap(~ class, nrow = 2)

# p9 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) +
#   facet_grid(drv ~ cyl)

# p10 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) +
#   facet_grid(.~ cyl)

# p11 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy)) +
#   facet_grid(cyl ~ .)
##############  excercise end ####################



################ 几何学的对象  ###################
# p12: 使用平滑的线拟合数据，注意 geom_smooth 不是设置 shape
# p13: 使用 drv 列数据划分映射不同的线类型
# p14: 画多个数据图
# p15: 画多个图，并全局设置  x, y 的映射
# p16: 画多个数据图，子图使用部分的数据(指定 data), 同时不显示置信区间（se）
# p17: 防止点重叠，对每个点增加随机噪音

# p12 = ggplot(data = mpg) + 
#   geom_smooth(mapping = aes(x = displ, y = hwy))

# p13 = ggplot(data = mpg) + 
#   geom_smooth(mapping = aes(x = displ, y = hwy, linetype=drv))

# p14 = ggplot(data = mpg) + 
#   geom_point(mapping = aes(x = displ, y = hwy))+
#   geom_smooth(mapping = aes(x = displ, y = hwy))

# p15 = ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
#    geom_point() +
#    geom_smooth()

# p16 = ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
#    geom_point(mapping = aes(color = class)) +
#    geom_smooth(data = filter(mpg, class == 'subcompact'), se = FALSE)


p17 = ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
   geom_point(mapping = aes(x = displ, y = hwy), position = 'jitter')

################# 几何学的对象 end  ##############





# 保存图片到本地
ggsave('./mpg.png', plot = p17)

