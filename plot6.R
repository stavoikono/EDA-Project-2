### Loading the libraries
library(dplyr)
library(ggplot2)

### downloading the data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp,mode="wb")
unzip(temp,c("summarySCC_PM25.rds","Source_Classification_Code.rds"))
unlink(temp)

### Loading the data
df <- readRDS("summarySCC_PM25.rds")
df2 <- readRDS("Source_Classification_Code.rds")

### Plot 6
la_balt <- df %>% filter(fips=="24510"| fips == "06037" & type=="ON-ROAD") %>%
  group_by(fips,year) %>% summarise(emissions=sum(Emissions))

ggplot(la_balt, aes(x=year,y=emissions,group=fips,colour=fips))+geom_line() + 
  labs(x="Year",y="Total Emission from motor vehicles") + 
  ggtitle("Emissions of PM2.5 in Baltimore City(24510) and Los Angeles(06037)")