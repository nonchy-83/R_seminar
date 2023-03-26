##第三回R課題、5月23日

library(tidyverse)
library(readxl)
df_exam <- read_excel("R/R_Seminar/Data/R03_BMI.xlsx")
 df_exam <- df_exam %>% 
  mutate(BMI = weight/(height/100)^2)

df_exam1 <- read_excel("R/R_Seminar/Data/R03_exam.xlsx")
df_exam1 <- df_exam1 %>% 
  mutate(city = "Kunitachi")
df_exam1 %>% 
  filter(age == 19)

df_exam2 <- read_excel("R/R_Seminar/Data/R03_exam2.xlsx")
df_exam2 <- df_exam2 %>% 
  mutate(city = "Kodaira")

df_exam_bind_rows <- df_exam1 %>% 
  bind_rows(df_exam2)

df_exam_full_join <- df_exam_bind_rows %>% 
  full_join(df_exam, by = "id")
df_exam_full_join

df_exam_full_join <- df_exam_full_join %>% 
  mutate(type = case_when(sex == "M" & BMI >= 23 ~"B",
                           sex == "M" & BMI < 23 ~"A",
                           sex == "F" & BMI >= 23 ~"K",
                           sex == "F" & BMI < 23 ~ "E"))
df_exam_full_join %>% 
  count(sex, BMI,type)
  
