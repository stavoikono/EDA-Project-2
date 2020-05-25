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

### plot 2
balt <- df %>% filter(fips == "24510") %>% group_by(year) %>% summarise(emissions=sum(Emissions))

barplot(names=as.factor(balt$year),height=balt$emissions,xlab="Year",ylab="PM2.5 Emissions",
        main="PM2.5 Emissions from Baltimore", col="blue")