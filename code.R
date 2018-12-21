# Abrir bibliotecas
library(xml2)
library(dplyr)
library(tidyverse)
library(XBRL)
library(reshape2)

link <- "dados/instancia.xml"

siconfi2 <- xbrlDoAll(link, cache.dir = "XBRLcache", prefix.out = NULL, verbose = T)

nomes<-unique(siconfi2$fact$elementId)

siconfidataframe <- siconfi2$fact
siconfidata <- data.frame(matrix(ncol=length(nomes), nrow = 0))
names(siconfidata) <- nomes

siconfidata <- siconfidataframe %>%
  filter(elementId != "gl-cor_entriesType") %>%
  filter(elementId != "gl-bus_periodIdentifier") %>% 
  filter(elementId != "gl-bus_periodDescription") %>%
  filter(elementId != "gl-bus_periodStart") %>%
  filter(elementId != "gl-bus_periodEnd")
  select()

nomes <- unique(siconfidata$elementId)
nomes2 <- 1:12
posicao_u <- which(siconfidata$unitId %in% "u")
posicao_u

siconfidata2 <- siconfidata %>%
  select(fact,unitId) %>%
  spread_(fact, unitID)
  

