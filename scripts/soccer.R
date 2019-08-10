library(dplyr)
library(ggplot2)
library(data.table)
library(tidyr)
library(stringr)
library(lubridate)
library(broom)
library(infer)
library(foreign)
library(tidyverse)
library(readxl)
library(stringi)
library(tidypredict)

df <- read_csv("/Users/julian/Downloads/spi_matches.csv")

df$year<-str_split_fixed(df$date, "-", n=3)[,1]
df$month<-str_split_fixed(df$date, "-", n=3)[,2]
df$day<-str_split_fixed(df$date, "-", n=3)[,3]
df$year_month <- paste(df$year, "-", df$month)


la_liga <- df%>%
  filter(league == "Spanish Primera Division")%>%
  select(team1)%>%
  unique()%>%
  unlist()

premier <- df%>%
  filter(league == "Barclays Premier League")%>%
  select(team1)%>%
  unique()%>%
  unlist()



df$invloves_la_league_team <-0
df$involves_premier_league_team <-0
df[df$team1 %in% la_liga | df$team2 %in% la_liga, "match_invloving_teams_from:"] <- "la_liga"
df[df$team1 %in% premier | df$team2 %in% premier, "match_invloving_teams_from:" ]  <- "premier"
df[(df$team1 %in% premier | df$team2 %in% premier) &  (df$team1 %in% la_liga | df$team2 %in% la_liga), "match_invloving_teams_from:" ]  <- "both"

df<-df%>%
  group_by(year_month, `match_invloving_teams_from:`)%>%
  mutate(total_matches_involving = n())

  
plot <- df[!is.na(df$`match_invloving_teams_from:`),]%>%
  select()

colnames(df)
ggplot(plot, aes(x = plot$))


plot$total_matches_involving


#get games playes up to date 
#get 


ggplot( ,], aes(x = score1-score2))+
  geom_point()+
  facet_wrap(~month)


