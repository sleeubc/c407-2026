#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: setup
#| include: false
knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)
#
#
#
#
#
#
#
#| eval: false
install.packages("tidyverse")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
library(tidyverse)
bca <- read_rds("data/bca252.rds")
```
#
#
#
#
#| eval: false
bca %>% head() %>% View
```
#
#
#
#
#
#
#
#
#
#
#| echo: false
op <- options("width"=1000)
bca %>% head() %>% kableExtra::kable()
options(op)
```
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| eval: false
library(lubridate)

avg_price <- bca %>% 
	group_by(sale_year = year(sale_date)) %>% 
	summarise(avg_price = mean(price, na.rm=TRUE))

avg_price
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| echo: false
library(lubridate)

avg_price <- bca %>% 
	group_by(sale_year = year(sale_date)) %>% 
	summarise(avg_price = mean(price, na.rm=TRUE))

avg_price %>% kableExtra::kable()
```
#
#
#
#
#
#
#
#
#
#| eval: false
ggplot(avg_price, aes(sale_year, avg_price)) + 
	geom_line() + 
	geom_point() + 
	scale_y_continuous(labels = scales::comma) 

ggsave("Temp/avg_price.png", width = 8, height = 4.5)
#
#
#
#
#
#
#
#
#
#| echo: false
ggplot(avg_price, aes(sale_year, avg_price)) + geom_line() + geom_point() + scale_y_continuous(labels = scales::comma)
#
#
#
#
