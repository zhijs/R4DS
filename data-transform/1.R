library(nycflights13)
library(tidyverse)

####################
# pre：数据结构介绍
# dbl: stands for doubles, or real numbers
# dttm: stands for date-times (a date + a time)
# lgl:  stands for logical, vectors that contain only TRUE or FALSE
# fctr:  stands for factors
#
#
# a1: filter() 数据过滤，选择指定列为指定值的数据
# a2: filter() 逻辑操作符过滤数据
# a3: arrange() 按照指定的列排序
# a4: arrange + desc 降序
# a5: NA 数值都是排在最后的
# a6: 将 NA 值排在前面
# a7: select 选择指定的列(不是常用的方法)
# a8: select + everything() 选择指定的列和剩余的列
# a9: select + 模糊匹配其他的列
# a10: mutate 增加新的一列
# a11: transmute 只保留新的列
####################


a1 = filter(flights, month == 1, day == 1)

# 注意使用单逻辑符
a2 = filter(flights, month == 11 | month == 12) # equal
a2 = filter(flights, month %in% c(11, 12))

# 先按 year 升序，再按 month 升序
a3 = arrange(flights, year, month, day)

a4 = arrange(flights, desc(dep_delay))

df = tibble(x = c(5, 2, NA))
a5 = arrange(df, c)
a5 = arrange(df, desc(x))


a6 = arrange(df, desc(is.na(x)), x)


# 选择 year, month, day 列
a7 = select(flights, year, month, day)

a8 = select(flights, time_hour, air_time, everything())

# 选择列名是以 car 开头的，类似的还有 ends_with contains, matches
a9 = select(flights, starts_with('car'))

flights_sml = select(flights,
  year:day,
  ends_with('delay'),
  distance,
  air_time
)

# 增加新的一列
a10 = mutate(flights_sml, 
  gain = dep_delay - arr_delay,
  speed = distance / air_time * 60
)


a11 = transmute(flights_sml,
  gain = dep_delay - arr_delay,
  speed = distance / air_time * 60
)