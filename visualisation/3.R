library(tidyverse)


# tidyverse 集合了 ggplot2 tibble tidyr readr 常用包的集合包

# 设置目录
setwd('/public/home/yangzhi/project/bioinformation/R4ds/visualisation')

# print(diamonds)


## coord_flip 坐标系翻转，对于 x label 很长的图标很有用, 否则横坐标展示会重叠
p1 = ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip() 



## p2 绘制地图
# 获取新西兰地图数据 
nz <- map_data('nz')

# geom_polygon 绘制多边形， group: 指定 group 列相同的值可以画到一个多边形里面, 这里省略了 data, 和 mapping 参数名
# p2 = ggplot(nz, aes(long, lat, group = group)) +
#   geom_polygon(fill = 'white', color = 'black')

## p3 coord_quickmap 对地图做比例适配
# p3 = ggplot(nz, aes(long, lat, group = group)) +
#   geom_polygon(fill = "white", colour = "black") +
#   coord_quickmap()


## coord_polar 画极坐标系

# 先画条形图，不展示图列
# theme(aspect.ratio = 1) 图宽高比 1:1
# labs(x = NULL, y = NULL) 隐藏 x 轴 y 轴标签
bar = ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  )+
  theme(aspect.ratio = 1)+
  labs(x = NULL, y = NULL) +
  coord_polar()


ggsave('./coord.png', bar)