library(dplyr)
library(ggplot2)

NEI  <- as.data.frame( readRDS("summarySCC_PM25.rds"))
SCC  <- as.data.frame(readRDS("Source_Classification_Code.rds"))
MRG <- merge(NEI, SCC, by = "SCC")
EX5 <-MRG %>% filter( (fips == "24510" & grepl("[Vv]ehicle", MRG$EI.Sector))) %>% group_by(year) %>% summarize (sum(Emissions))
colnames(EX4) <- c("Year", "Total Emmisions")
png("Plot5.png")
g <- ggplot(EX5)
g + geom_line(aes( Year,  `Total Emmisions`), col ="green") + 
  geom_point(aes( Year,  `Total Emmisions`), lwd = 4, col = "red") +
  geom_text(aes(Year,  `Total Emmisions`, label = round(`Total Emmisions`,digits = 1)), hjust = 0.5,  vjust = -1) + 
  labs( x= "years", y = "Emissions") + 
  ggtitle( "Emissions from motor vehicle in Baltimore City")

dev.off()


