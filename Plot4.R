Exer4 <- function (){
  library(dplyr)
  library(ggplot2)
  NEI  <- as.data.frame( readRDS("summarySCC_PM25.rds"))
  SCC  <- as.data.frame(readRDS("Source_Classification_Code.rds"))
  png("plot4.png")
  x <- inner_join(NEI, SCC, by = c("SCC" = "SCC"))
  y  <-  x %>% filter (grepl('[Cc]oal', x$SCC.Level.Three)) %>% group_by(year) %>% summarise(sum(Emissions))
  g  <-  ggplot(y)
  g + geom_col(aes(year, `sum(Emissions)`),col="steelblue") + geom_line(aes(year, `sum(Emissions)`), lwd = 2, col = "green") + 
    geom_point(aes(year, `sum(Emissions)`), lwd = 4 , col = "red") + 
    labs( x= "years", y = "Emissions uin Tons") + 
    ggtitle( "Coal Emissions in Tons")
  
  dev.off()
  Exer4 <-x             
}