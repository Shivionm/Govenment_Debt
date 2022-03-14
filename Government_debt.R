pkgs <- c("tidyverse", "ggplot2", "lubridate", "janitor")
install.packages(pkgs)
lapply(pkgs, library, character.only = TRUE)

library(readr)
library(tidyr)
library(lubridate)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(janitor)

Gov <- read_csv("./Government_debt_2016_2020.csv")

colnames(Gov)[3] = "Debt"

ggplot(Gov, aes(Countries,Debt)) + geom_line() + coord_flip() +
  ggtitle(expression("Debt by Countries"), "") + 
  theme(plot.title = element_text(size = 20, color = "red", hjust = .50))

slice_max(Gov, prop = .06, Debt) %>% 
  ggplot(aes(Debt, Countries)) + geom_point() + 
  ggtitle("The top 5 \n Countries with the most debt") + 
  theme(plot.title = element_text(size = 20, color = "blue", hjust = .50))


slice_min(Gov, prop = .06, Debt) %>% 
  ggplot(aes(Debt, Countries)) + geom_point() + 
  ggtitle("The top 5 \n Countries with the least debt") + 
  theme(plot.title = element_text(size = 20, color = "brown", hjust = .50))






