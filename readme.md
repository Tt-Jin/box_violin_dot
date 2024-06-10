# 箱式图-半边小提琴图-抖动点图

1. geom_half_violin()函数绘制半边小提琴图，需要加载 R 包：gghalves。因为还要在左边绘制抖动点图，这里通过 position_nudge 设置小提琴图的位置。

2. geom_boxplot()函数绘制箱式图，同样通过 position_nudge 设置箱式图的位置，和小提琴图的位置一样，这样使他们能重叠在一起。

3. geom_jitter()函数绘制抖动点图，通过 position_nudge 设置位置在小提琴图的左边。

4. geom_signif()函数显著性检验。

### 最重要的是：

码代码不易，如果你觉得我的教程对你有帮助，请关注：

个人小红书 **Ms.Tt (号Ttian6688)**

个人公众号 **MsTt笔记**

