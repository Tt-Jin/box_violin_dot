library(tidyverse)
library(gghalves)
library(ggsignif)

#读入数据
df <- read.csv('BGCs_numbers_per_genomes.csv',header = T)

#转换成长数据
df1 <- gather(df) %>%
  rename("Clade"=key)

#设置颜色
my_color = c('#84a354','#b15053','#cf9a2c','#7d7c7f')

#排好序
variable <-c('subtills','cereus','megaterium','circulans')
my_sort <-factor(variable,levels = variable)

ggplot(df1,aes(factor(Clade,levels = my_sort),value))+
  geom_half_violin(aes(fill=factor(Clade,levels = my_sort)),
                   side ='r',
                   position = position_nudge(x = .25, y = 0),
                   cex=0.8)+
  geom_boxplot(fill="white",
               width=0.1,cex=0.8,
               position = position_nudge(x = .25, y = 0))+
  geom_jitter(aes(color=factor(Clade,levels = my_sort)), 
              size=1.5,
              position = position_jitter(width = 0.1)) +
  geom_signif(comparisons = list(c("subtills","cereus"),
                                 c("cereus","megaterium"),
                                 c("megaterium","circulans")), 
              map_signif_level = function(p) sprintf("p = %.2g", p), 
              step_increase = 0.05,
              y_position = c(23, 20, 17),
              textsize = 5, vjust = -0.2,
              tip_length = 0) +
  scale_fill_manual(values = my_color)+
  scale_color_manual(values = my_color,guide='none') +
  theme_test(base_size =15)+
  labs(x=NULL,y='No.of BGCs / genome')+
  scale_y_continuous(limits =c(0,25))+
  theme(legend.title =element_blank(),
        axis.title =element_text(size =21, face = "bold"),
        axis.text =element_text(color ='black',size = 17,face = "bold"),
        axis.text.x =element_text(face ='bold.italic'),
        legend.text = element_text(size = 14,face = "bold.italic"))

ggsave("box-violin-dot.png", width = 8, height = 6, dpi = 600)
ggsave("box-violin-dot.pdf", width = 8, height = 6)

