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

### Plot 3
type <- df %>% filter(fips == "24510") %>% group_by(type,year) %>% summarise(emissions=sum(Emissions))
ggplot(type,aes(x=as.factor(year),y=emissions,group=type,colour=type))+geom_line() +
  labs(x="Year",y="Total emissions") +
  ggtitle("Emissions of PM2.5 from Baltimore city per type")