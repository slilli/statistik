## Lilli Schuckert
## Statistik für Biowissenschaften 2
## Übung 1 zum 20.04.2021
## ----------------------------------------------------------------------------

library(tidyverse)
library(cutpointr)

## ----------------------------------------------------------------------------
## Aufgabe 1
## b) Modell in y ~ x : Tumorgröße ~ TestScore
## ----------------------------------------------------------------------------
## c)
tumor_tbl <- tibble(
  Tumorgröße = c(12, 16, 22, 24, 10, 8, 14, 21, 12),
  TestScore = c(2, 3.5, 5.5, 4, 2.5, 1, 3, 5, 1.5)
)
tumor_tbl

fit <- glm(Tumorgröße ~ TestScore, data = tumor_tbl, family = gaussian)

ggplot(tumor_tbl, aes(y = Tumorgröße, x = TestScore)) + geom_point() + 
  geom_smooth(method = 'lm')
## ----------------------------------------------------------------------------
## f) 
tumor_tbl$TestScore <- ifelse(tumor_tbl$TestScore >=3,1,0)
tumor_tbl

## ----------------------------------------------------------------------------
## h)

ggplot(tumor_tbl, aes(x=factor(TestScore), y = Tumorgröße))+
  geom_boxplot() +
  labs(title = "Test-Score Dichtomisierung", x = "TestScore", y = "Tumorgröße")+
  theme_bw()
