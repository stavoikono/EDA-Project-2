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

### plot 5
motor <- df %>% filter(fips == "24510" & type=="ON-ROAD") %>% group_by(year) %>% summarise(emissions=sum(Emissions))
ggplot(motor, aes(year,emissions))+geom_line(colour="DarkGreen") +
  labs(x="Year", y="Total Emissions from motor vehicles") +
  ggtitle("Emissions of PM2.5 from motor vehicles in Baltimore City(24510)")