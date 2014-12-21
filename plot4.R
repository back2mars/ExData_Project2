NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ALL <- merge(NEI, SCC, by='SCC')
names <- grep('coal', ALL$Short.Name, ignore.case=TRUE)
NEW <- ALL[names,]
TotalByYear <- aggregate(Emissions~year, NEW, sum)
png('plot4.png', width=640, height=480)
pt <- ggplot(TotalByYear, aes(x=year, y=Emissions)) +
   geom_point() +
   geom_smooth(method='loess') +
   ggtitle("Total PM2.5 Coal Emissions in US")
print(pt)
dev.off()