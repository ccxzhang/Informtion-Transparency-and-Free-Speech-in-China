library(tidyverse)
library(stargazer) 
library(sandwich, lmtest, zoo)
library(mfx)

## Set the document folder as working directory
setwd("~/Documents/PPOL565/Project")

## Load the dataset
dat<- read.csv("iptic_index.csv")

## Logistic regressions for q1 and q3
mod1<- glm(q1~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))



mod2<- glm(q3~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))


## Logistic regressions for qs
mod3<- glm(qs~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))

stargazer(mod1, mod2, mod3, title= "Results", align = TRUE, header = FALSE,
          no.space = FALSE, font.size = "small", df = FALSE)

logitmfx(mod1, data= dat)
