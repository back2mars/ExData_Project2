NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- NEI[NEI$fips == "24510", ]
TotalByYear <- aggregate(Emissions~year+type, Baltimore, sum)
png('plot3.png', width=640, height=480)
pt <- ggplot(TotalByYear, aes(x=year, y=Emissions, colour=type)) +
   geom_point() +
   geom_smooth(method='loess') +
   ggtitle("Total PM2.5 Emissions by Type in Baltimore")
print(pt)
dev.off()