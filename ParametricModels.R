library(tidyverse)
library(stargazer) 
library(sandwich, lmtest, zoo)
library(mfx)

## Set the document folder as working directory
setwd("~/Documents/PPOL565/Project/Ideology-and-Public-Trust-in-China")

## Load the dataset
dat<- read.csv("Data/iptic_index.csv")

## Logistic regressions for q3 and q5
mod1<- glm(q3~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))



mod2<- glm(q5~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))


## Logistic regressions for qs
mod3<- glm(qs0~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))

mod4<- glm(qs01~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))

mod5<- glm(qs10~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))

mod6<- glm(qs2~Democracy+ Freedom+ Market+ Socialism+ Globalization+ Traditionalism+ Nationalism+
             hs+ college+ above_college+ i50_100k+ i100_150k+ i150_300k+ ia300k+ 
             north+ northeast+ east+ southcentral+ southwest+ age+ gender,
           data= dat, family= binomial(link= "logit"))

stargazer(mod1, mod2, mod3,mod4, mod5, mod6, title= "Results", align = TRUE, header = FALSE,
          no.space = FALSE, font.size = "small", df = FALSE)
