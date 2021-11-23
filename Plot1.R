Exer1 <- function (){
  library(dplyr)
  NEI  <- as.data.frame( readRDS("summarySCC_PM25.rds"))
  SCC  <- as.data.frame(readRDS("Source_Classification_Code.rds"))
  png("plot1.png")
  x <-NEI %>% group_by(year) %>% summarise (sum(Emissions)/1000000)
  colnames(x) <- c("year", "total_PM2.5" )
  par(mar= c(2,4,4,4))
  with( x, {
    barplot(total_PM2.5, ylab = "Total PM2.5", ylim = c(0, 10), names.arg = year, col="steelblue", main="Total Emissions PM2.5 Tons in millions per year")
    text(year, total_PM2.5 + 1, labels = as.character(round(total_PM2.5,2)))
    lines(total_PM2.5,  lwd = 2,col="red",lty=1)
    mtext(2,text="(in Millions)",line=2)
    
  })
  dev.off()
            
}