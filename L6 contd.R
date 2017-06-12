#Lecture 06

#dataframe

tt<-c(1,2,3,4,5,6)
write.csv (M1, file = "tt")

M3 <- read.csv("tt")

getFile <- "https://www.nseindia.com/content/historical/EQUITIES/2017/JAN/cm25JAN2017bhav.csv.zip"
getFile

download.file(getFile,"tt.zip","libcurl")

unzip("tt.zip")

df1 <- read.csv(unzip("tt.zip"))
df1 <- read.csv(unz("tt.zip", "cm25JAN2017bhav.csv"))
df1 <- read.csv(unzip("tt.zip"), stringsAsFactors = F)
df1 <- read.csv("cm25JAN2017bhav.zip")

str(df1)
summary(df1)
head(df1)

length(df1)
colnames(df1)
nrow(df1)
ncol(df1)
df1[,-14] # drop column 14
str(df1)                    
                    
                    
df1[1,2]
df1[1,"SERIES"]
df1[,2]
df1[1,]$SERIES
df1$SERIES[1]
df1[1]
df1[,1]
df1[1,]
df1$SYMBOL
df2 <- cbind(df1,c(1:nrow(df1)))
unique(df1$series)
levels(df1$series)
df1$SYMBOL<-as.character(df1$SYMBOL)
str(df1)
df1$SERIES<-as.character(df1$ SERIES)
str(df1)


#subsets
df1 <- df1[!is.na(df1$SERIES),]
str(df1)
tapply(df1$SERIES, df1$SERIES, length)
df1[(df1$SERIES=="DR"),]
df1[(df1$SERIES=="NN"),]

#did assignment on page 4 at home

#for loop..did if else at home

for (year in c(2010,2011,2012,2013,2014,2015)) {
  print(paste("year is", year))
}

#switch statement

switch (5,"fgh","dfgh","vcbnm","rtyu","yuio","efgb")

#while loop #easy #skipped

#functions

addition<- function(x,y) {
  #fn to find sum of the series
  result<- x+y
  print(paste("sum of",x,"&",y,"is",result))
}

addition(3,7)






























        