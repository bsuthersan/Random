library(tidyverse)
library(ggthemes)

##Source: https://data.gov.au/dataset/poverty-reduction-programmes/resource/7c9bc20d-310a-4339-a4c6-edb13606dd1c

data <- read.csv("https://raw.githubusercontent.com/bsuthersan/Random/master/ratio_welfare.csv", quote = "")

bstheme <- ggthemes::theme_fivethirtyeight() + theme(axis.text.x = element_text(angle = 90))

data %>%
  ggplot(aes(Year)) +
  geom_line(aes(y = Ratio.of.welfare.expenditure.to.tax.revenue), group=1, color='steelblue', size = 1) +
  theme(axis.text.x = element_text(angle = 90)) +
  bstheme +
  ggtitle("Ratio of welfare expenditure to tax revenue, Australia, 2006-2016")
  

