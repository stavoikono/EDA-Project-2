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

### plot 1
sumd <- df %>% group_by(year) %>% summarise(emissions=sum(Emissions))

plot(sumd$year,sumd$emissions/1000000
     , type = "l",col="red", xlab="Year",ylab="Total emissions of PM2.5 in million of tons",
     main = "Total emissions in USA from 1999 to 2008")
