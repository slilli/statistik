## Lilli Schuckert
## Statistik f�r Biowissenschaften 2
## �bung 1 zum 20.04.2021
## ----------------------------------------------------------------------------

library(tidyverse)
library(cutpointr)

## ----------------------------------------------------------------------------
## Aufgabe 1
## b) Modell in y ~ x : Tumorgr��e ~ TestScore
## ----------------------------------------------------------------------------
## c)
tumor_tbl <- tibble(
  Tumorgr��e = c(12, 16, 22, 24, 10, 8, 14, 21, 12),
  TestScore = c(2, 3.5, 5.5, 4, 2.5, 1, 3, 5, 1.5)
)
tumor_tbl

fit <- glm(Tumorgr��e ~ TestScore, data = tumor_tbl, family = gaussian)

ggplot(tumor_tbl, aes(y = Tumorgr��e, x = TestScore)) + geom_point() + 
  geom_smooth(method = 'lm')
## ----------------------------------------------------------------------------
## f) 
tumor_tbl$TestScore <- ifelse(tumor_tbl$TestScore >=3,1,0)
tumor_tbl

## ----------------------------------------------------------------------------
## h)

ggplot(tumor_tbl, aes(x=factor(TestScore), y = Tumorgr��e))+
  geom_boxplot() +
  labs(title = "Test-Score Dichtomisierung", x = "TestScore", y = "Tumorgr��e")+
  theme_bw()
