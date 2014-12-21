NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ALL <- merge(NEI, SCC, by='SCC')
NEW <- NEI[(NEI$fips == '24510' | NEI$fips == '06037') & NEI$type == 'ON-ROAD',]
TotalByYear <- aggregate(Emissions~year+fips, NEW, sum)
TotalByYear$fips[TotalByYear$fips == '24510'] <- 'Baltimore'
TotalByYear$fips[TotalByYear$fips == '06037'] <- 'LA'
png('plot6.png', width=480, height=480)
pt <- ggplot(TotalByYear, aes(x=year, y=Emissions, colour=fips)) +
   geom_point() +
   geom_smooth(method='loess') +
   ggtitle("Total PM2.5 Emissions in Baltimore vs LA")
print(pt)
dev.off()
