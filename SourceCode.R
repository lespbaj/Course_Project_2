nei <- function (){
   readRDS("summarySCC_PM25.rds")
  
  
}
scc <- function (){
  
   readRDS("Source_Classification_Code.rds")
  
}
Exer1 <- function (dataset){

  x <-dataset %>% group_by(year) %>% summarise (sum(Emissions)/1000000)
  colnames(x) <- c("year", "total_PM2.5" )
  png("plot1.png", width=480, height = 480 )
  with ( x,{
          barplot(total_PM2.5, ylab = "Total PM2.5", ylim = c(0, 10), names.arg = year, col="steelblue")
          text(xx, x$total_PM2.5 + 1, labels = as.character(round(x$total_PM2.5,2)))
          lines(xx, x$total_PM2.5, lwd = 2,col="red",lty=1)
          mtext(2,text="(in Millions)",line=2)
          title(main="Total Emissions PM2.5 Tons in millions per year")}
  )
 
  dev.off()
  Exer1 <-x             
}
Exer2 <- function (dataset){
  
  x  <- dataset %>% filter(fips == "24510")  %>%   group_by(year)  %>% summarise(sum(Emissions))
  colnames(x) <- c("year", "total_PM2.5" )
  png("plot2.png", width=480, height = 480 )
  par (mfcol = c(1,2), mar=c(4,4,2,2), oma = c(0,0,2,0))
  with(x ,{
            barplot(x$total_PM2.5, ylab = "Total PM2.5",xlab = "years", ylim = c(0, 5000), names.arg = x$year, col="steelblue")
            text(xx, x$total_PM2.5 + 100, labels = as.character(round(x$total_PM2.5)))
            lines(xx, x$total_PM2.5, lwd = 2,col="red",lty=1)
            mtext(2,text="Total",line=2, outer= TRUE)
            
            }
        )
  with(x ,{
            plot ( x$year,  x$total_PM2.5 , col = "red", pch = 3, ylim= c(0,5000), ylab = "Total PM2.5", xlab = "years")
            lo <- lm(x$total_PM2.5~x$year)
            abline(lo, col="green", lty ="dotdash")
            text (x= 2004, 2800, "linear regession", srt = -23, col = "green")
          }
      )
  title(main="Total PM2.5 Tons per year", outer = T)
  
 
  dev.off()
  Exer1 <-x             
}
