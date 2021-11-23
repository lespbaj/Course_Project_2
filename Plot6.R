library(dplyr)
library(ggplot2)

NEI  <- as.data.frame( readRDS("summarySCC_PM25.rds"))
SCC  <- as.data.frame(readRDS("Source_Classification_Code.rds"))
MRG <- merge(NEI, SCC, by = "SCC")
EX6 <-MRG %>% filter( (fips == "24510" | fips == "06037") & grepl("[Vv]ehicle", MRG$EI.Sector)) %>% group_by(year, fips) %>% summarize (Emissions = sum(Emissions)) %>% mutate (County = case_when(fips == "24510" ~ "Baltimore City", fips == "06037" ~ "Los Angeles County" )) %>% select(year, Emissions, County )
png("Plot6.png")
g <- ggplot(EX6, aes(year, Emissions, color= County))
g + geom_line()  + ylim(0, 4700)+ xlim(1999, 2009) + geom_point(lwd = 4) +
  geom_text(aes(label = round(Emissions,digits = 1)), hjust = 0.25,  vjust = -1) + 
  labs( x= "years", y = "Emissions") + 
  ggtitle( "Emissions Baltimore City vs Los Angeles County")

dev.off()
