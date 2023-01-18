#import libraries
library(tidyverse)

#import data from file
getwd()
gapminder_data <- read.csv("data/gapminder_data.csv")

#common simple analyses
summarise(gapminder_data, averagelifeexp=mean(lifeExp), medianlifeexp=median(lifeExp))

#learning to pipe (assumes first argument is what you piped into it, can pipe multiple functions together)
gapminder_summary <- gapminder_data%>%
  summarize(averagelifeexp=mean(lifeExp))

#filter data (double equal is equalivalent to the value)
gapminder_summary_2007<-gapminder_data%>%
  filter(year==2007)%>%
  summarize(average=mean(lifeExp))

gapminder_data%>%
  filter(year==1952)

gapminder_data%>%
  summarise(Firstyear=min(year))

gapminder_data%>%
  filter(year==min(year))%>%
  summarise(Average_GDP=mean(gdpPercap))

#Using group_by(), makes grouped dataframe. Can do statistics within groups.
gapminder_data%>%
  group_by(year)%>%
  summarise(average=mean(lifeExp))

