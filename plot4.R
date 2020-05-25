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

### Plot 4
filter <- grepl("Coal",df2$Short.Name)
coaled <- df2[filter,]
merged <- merge(coaled,df, by="SCC")
merg <- merged %>% group_by(year) %>% summarise(emissions=sum(Emissions, na.rm=T))
ggplot(merg, aes(year,emissions))+geom_line(colour="green") +
  labs(x="Year",y="Total Emissions") +
  ggtitle("Coal related Emissions of PM2.5")