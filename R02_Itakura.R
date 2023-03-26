##第2回課題、5月15日

library(tidyverse)
library(readxl)
df <- read_excel("Data/R03_BMI.xlsx")
df

df %>% dim()
df %>% names()
df %>% head()
df %>% summary()
