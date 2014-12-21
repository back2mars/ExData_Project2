NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
TotalByYear <- aggregate(Emissions~year, NEI, sum)
png('plot1.png', width=400, height=400)
plot(TotalByYear$year, TotalByYear$Emissions, type='l', main="Total PM2.5 Emissions per Year", xlab='Year', ylab='Total PM2.5 Emissions')
dev.off()
 



dev.off()