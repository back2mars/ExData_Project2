NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ALL <- merge(NEI, SCC, by='SCC')
NEW <- NEI[NEI$fips == '24510' & NEI$type == 'ON-ROAD',]
TotalByYear <- aggregate(Emissions~year, NEW, sum)
png('plot5.png', width=640, height=480)
plot(TotalByYear$year, TotalByYear$Emissions, type='l', main='Total Vehicle Emissions in Baltimore', xlab='Year', ylab='Emissions')
dev.off()