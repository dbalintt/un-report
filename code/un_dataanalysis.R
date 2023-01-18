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
  summarize

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


#group_by() to make grouped dataframes
gapminder_data%>%
  group_by(year, continent)%>%
  summarise(average=mean(lifeExp),
            error=sd(lifeExp))

#mutate function, only prints the extra data, doesnt save. need to write to new object like shown in filter data above

gapminder_data%>%
  mutate(gdp=pop*gdpPercap)

#mutate a new column which is population in millions

gapminder_data%>%
  mutate(popinmillions=pop/1000000)


#select function to choose parts of dataframe or remove parts specifically

gapminder_data%>%
  select(pop,year)

gapminder_data%>%
  select(-continent)



#pivot_wider to make things more human readable, names_from becomes column name and values_from become inner data

gapminder_data%>%
  select(country, continent, year, lifeExp)%>%
  pivot_wider(names_from=year, values_from=lifeExp)





