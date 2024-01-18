library(ggplot2)
library(tidyr)
library(reshape2)

setwd("/Users/idamei/phd")

df = read.table("data/wzy/stereochemistry.tsv", sep = '\t', header = TRUE)

df_melt = melt(df)

colnames(df_melt) = c('Family', 'bond', 'count')

order = c('GT122', 'GT123', 'GT124', 'GT125', 'GT126', 'GT127',
          'GT128', 'GT129', 'GT130', 'GT131', 'GT132', 'GT133', 'GT134', 'GT135')

ggplot(data=df_melt, aes(x=factor(Family, level=order), y=count, fill=bond)) +
  geom_bar(stat="identity") +
  ylab('count') +
  xlab('') +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1)) +
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
