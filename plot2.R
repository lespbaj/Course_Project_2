Exer2 <- function (){
  library(dplyr)
  NEI  <- as.data.frame( readRDS("summarySCC_PM25.rds"))
  SCC  <- as.data.frame(readRDS("Source_Classification_Code.rds"))

  x  <- NEI %>% filter(fips == "24510")  %>%   group_by(year)  %>% summarise(sum(Emissions))
  colnames(x) <- c("year", "total_PM2.5" )
  png("plot2.png")
  par (mfcol = c(1,2), mar=c(1,1,1,1), oma = c(0,0,2,0))
  with(x ,{
    barplot(x$total_PM2.5, ylab = "Total PM2.5",xlab = "years", ylim = c(0, 5000), names.arg = x$year, col="steelblue")
    text(year, total_PM2.5 + 100, labels = as.character(round(x$total_PM2.5)))
    lines( total_PM2.5, lwd = 2,col="red",lty=1)
    mtext(2,text="Total",line=2, outer= TRUE)
    
  }
  )
  with(x ,{
    plot ( year,  total_PM2.5 , col = "red", pch = 3, ylim= c(0,5000), ylab = "Total PM2.5", xlab = "years")
    lo <- lm(total_PM2.5~year)
    abline(lo, col="green", lty ="dotdash")
    text (x= 2004, 2800, "linear regession", srt = -23, col = "green")
    title(main="Total PM2.5 Tons per year", outer = T)
  }
  )
  
  
  dev.off()
              
}