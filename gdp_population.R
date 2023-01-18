#Analyze life expectancy and CO2 emissions versus population with gapminder
#Date: Jan 17, 2023
#Author: Diana Balint

#load in packages for analysis
library("tidyverse")
library(readr)
library("ggprism")

#read in data for analysis
gapminder_1997 <- read_csv("gapminder_1997.csv")

#Plotting data for visualization
ggplot(data=gapminder_1997) +
  aes(x=gdpPercap,y=lifeExp) + 
  labs(x="GDP per Capita",y="Life Expectancy (yrs)") +
  geom_point() +
  labs(title="Do people in wealthy countries live longer?") +
  aes(color=continent) +
  scale_color_brewer(palette="Set1") +
  aes(size=pop/1000000) +
  labs(size="Population in millions") +
  aes(shape=continent) 

#short-handed ggplot
ggplot(data=gapminder_1997)+
       aes(x=gdpPercap, y=lifeExp, color=continent, shape=continent, size=pop)+
       labs(x="GDP per Capita", y="Life Expectancy", 
            title="Do people in wealthy countries live longer", 
            size="Population in millions")+
       geom_point()



?geom_point
vignette("ggplot2-specs")


#read data for analysis
gapminder_data <- read_csv("gapminder_data.csv")
dim(gapminder_data)
head(gapminder_data)
tail(gapminder_data)

#learn about data
str(gapminder_data)

#plot gapminder_data
ggplot(data=gapminder_data)+
  aes(x=year, y=lifeExp, color=continent, group=country)+
  geom_line()

ggplot(data=gapminder_data)+
  aes(x=continent, y=lifeExp)+
  geom_violin(aes(fill=continent))+
  geom_jitter(aes(size=pop))


#histogram
#bins are the number of peaks
ggplot(gapminder_1997)+
  aes(x=lifeExp)+
  geom_histogram(bins=20)+
  theme_prism()

#plot continents individually
ggplot(gapminder_1997)+
  aes(x=gdpPercap, y=lifeExp)+
  geom_point()+
  facet_grid(rows=vars(continent))

ggplot(gapminder_1997)+
  aes(x=gdpPercap, y=lifeExp)+
  geom_point()+
  facet_wrap(vars(continent))

#save plots
ggsave("awesome_plot2.tiff", device="tiff",width=6, height=4)






#installed ggprism
install.packages("ggprism")
library("ggprism")

?ggplot

read_csv()
?read_csv
read_csv("gapminder_1997.csv")
read_csv(file="gapminder_1997.csv")

Sys.Date()
getwd()
sum(5,6)

?round
round(3.1415)
round(3.1415,3)
round(3.1415,digits = 3)
round(3.1415,digits=2)
round(digits=2,3.1415)
round(2,3.1415)
round(2.11111,3.1415)

