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



#Working with messy data,
#skip first row of data to exclude unneccessary data and specify own column names 
#c (concatenate) function for lists so arguments don't get confused with commas
co2_emissions_dirty <- read_csv("data/co2-un-data.csv", skip=2,
                                col_names=c("region","country","year","series","value","footnotes","source"))

#read.csv and read_csv different functions, using read_csv right now from readr package

co2_emissions_dirty

#have very long names in series column, need to change
#create new column with cleaner values using mutate
#recode changes values in column (old series) 
#have two different types of data in series and value, need to create better data visualization with pivot_wider
#add two new lines of code to only get year 2005 and remove year column, then assign object name

co2_emissions_2005 <- co2_emissions_dirty%>%
  select(country,year,series,value)%>%
  mutate(series=recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions",
                       "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions"))%>%
  pivot_wider(names_from=series,values_from=value)%>%
  filter(year==2005)%>%
  select(-year)

#bringing in 2007 population data
gapminder_data_2007 <- read_csv("data/gapminder_data.csv")%>%
  filter(year==2007)%>%
  select(country, pop, lifeExp, gdpPercap)


#join dataframes together
#inner join only shows exact matches between tables, unmatching partners discarded.
#if no by argument, will join based on all matching column names between dataframes
#anti-join shows all non-matching data between dataframes, based on first dataframe in function
#full join keeps all data from both dataframes regardless of matching
inner_join(co2_emissions_2005, gapminder_data_2007, by ="country")

anti_join(co2_emissions_2005, gapminder_data_2007)

full_join(co2_emissions_2005, gapminder_data_2007)

