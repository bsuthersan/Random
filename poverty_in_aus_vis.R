library(tidyverse)
library(ggthemes)

povertydata <- read.csv("https://data.gov.au/dataset/adb6d983-2f3d-4919-8738-209a0e03fb77/resource/dbe7fc7f-3d5f-4c99-8ca3-850b432ccb2e/download")

bstheme <- ggthemes::theme_fivethirtyeight() + theme(axis.title = element_text())


povertydata %>%
  filter(Number.of.years.in.poverty!=0) %>%
  gather(Gender, Percent, c(Men, Women)) %>%
  ggplot() +
  aes(Number.of.years.in.poverty, Percent, fill=Gender) + 
  geom_bar(stat='identity', width=0.7, position = position_dodge()) +
  ggtitle("Distribution of poverty in Australia, 2001 - 2015") +
  bstheme +
  xlab("Years in poverty") +
  ylab("Percentage (%)") +
  theme(legend.title = element_blank(), legend.position="top") +
  scale_fill_manual(values=c("#cccc00", "steelblue")) +
  labs(caption="Source:https://data.gov.au/dataset/adb6d983-2f3d-4919-8738-209a0e03fb77")
