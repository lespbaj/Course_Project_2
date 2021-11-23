Exer3 <- function (){
  library(dplyr)
  library(ggplot2)
  NEI  <- as.data.frame( readRDS("summarySCC_PM25.rds"))
  SCC  <- as.data.frame(readRDS("Source_Classification_Code.rds"))
  png("plot3.png")
  x <- NEI  %>% filter(fips == "24510")  %>%  group_by(across(c(year, type))) %>%  summarise (sum(Emissions))
  colnames(x) <- c("year", "type", "Emissions")
  g <-ggplot(x)
  g + geom_point (aes(x$year, x$Emissions, color=x$type), lwd = 4 ) +
    geom_line (aes(x$year, x$Emissions, color=x$type)   )
  
  dev.off()
  Exer3 <-x             
}