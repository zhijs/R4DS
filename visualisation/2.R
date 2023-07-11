library(tidyverse)


# tidyverse 集合了 ggplot2 tibble tidyr readr 常用包的集合包

# 设置目录
setwd('/public/home/yangzhi/project/bioinformation/R4ds/visualisation')

print(diamonds)


##############################
# p1: 展示条形图,用 diamonds 数据的 cut 作为每个条形图的分类，统计每种 cut 出现的次数
# p2: 条形图自定义 y 轴数据
# p3: 条形图自定义 y 轴数据（频率）
# p4: 统计总结每个类型 （cut）, 某个属性的最大最小值 
# p5: 填充边框颜色
# p6: 填充 bar 框颜色
# p7: 对特定每个列（x）, 在统计个数 count 的时候，按照某个特定列的占比填充颜色
# p8: 堆叠式柱状图，即在每个切割类别下(cut)，针对不同清晰度(clarity)的柱子紧密堆叠在一起
# p9: 堆叠式柱状图，即在每个切割类别下(cut)，针对不同清晰度(clarity)的的比例划分高度
##############################

# p1 = ggplot(data = diamonds) +
#   geom_bar(mapping = aes(x = cut))

demo = tribble (
  ~cut,  ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551    
)
# p2 = ggplot(data = demo) +
# geom_bar(mapping = aes(x = cut, y = freq), stat = 'identity')


# p3 = ggplot(data = diamonds) +
#   geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))


# p4 = ggplot(data = diamonds) +
#   stat_summary(
#      mapping = aes(x = cut, y = depth),
#      fun.min = min,
#      fun.max = max,
#      fun = median
    
#   )

# p5 = ggplot(data = diamonds) +
#   geom_bar(mapping = aes(x = cut, color = cut))

# p6 = ggplot(data = diamonds) +
#   geom_bar(mapping = aes(x = cut, fill = cut))


# p7 = ggplot(data = diamonds) +
#   geom_bar(mapping = aes(x = cut, fill = clarity))


# p8 = ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
#   geom_bar(alpha = 1/5, position = 'identity')

p9 = ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(position = 'fill')

# 保存图片到本地
ggsave('./diamond.png', plot = p9)