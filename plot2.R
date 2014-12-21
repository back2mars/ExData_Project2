NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- NEI[NEI$fips == "24510", ]
TotalByYear <- aggregate(Emissions~year, Baltimore, sum)
png('plot2.png', width=400, height=400)
plot(TotalByYear$year, TotalByYear$Emissions, type='l', main="Total PM2.5 Emission in Baltimore", xlab="Year", ylab='Total PM2.5 Emissions')
dev.off()