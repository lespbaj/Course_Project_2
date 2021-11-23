nei <- function (){
   as.data.frame( readRDS("summarySCC_PM25.rds"))
  
  
}
scc <- function (){
  
  as.data.frame(readRDS("Source_Classification_Code.rds"))
  
}

mrg  <- function (A, B, UnionField){
  
  merge(A, B, by = UnionField)
}
