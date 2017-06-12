#The melt function takes data in wide format and stacks a set of columns into a single column of data
#melt: Melt a data frame into form suitable for easy casting.

library(reshape2)
df1 <- swiss
df1$idVar <- rownames(df1)
molten <- melt(df1)


#cast
df2 <- dcast(molten, idVar ~ variable)
df2 <- dcast(molten, variable ~ idVar)


#hist++
v1 <- c(1, 2,2, 3,3,3, 4,4, 5,6,6, 7,7,7, 8,8, 9)
a <- hist(v1, breaks = 4)
#abline R function : An easy way to add straight lines to a plot using R 
#abline: This function adds one or more straight lines through the current plot.
abline(v=median(v1), col = "blue", lwd =1)
rug(v1)


#Barplot
df1 <- swiss
df1$cat <- cut(df1$Catholic, 5)
barplot(table(df1$cat), col="wheat")
x <- cbind(Edu = df1$Education, Fert = df1$Fertility)
x <- x[order(x[,1]),]
barplot(x, beside = TRUE, col=c("wheat","red"))
     main = "Swiss", sub = "Is education related to Fertility"
  #error in the above line   
     names.arg = c(row.names(df1), rep(" ", nrow(df1)))
     legend.text = c("Edu", "Fert")
     args.legend = list(x="topleft")
#did not execute barplot

     
     
#Boxplot
#Min, 1st Qu, Median, Mean, 3rd Qu, Max
boxplot(df1)
boxplot(df1$Fertility ~ df1$Education)
df1$edu <- cut(df1$Education, 5)
boxplot(df1$Fertility ~ df1$cat)
boxplot(df1$Fertility ~ df1$edu)


#Plots
#with: Evaluate an R expression in an environment constructed from 
#data, possibly modifying (a copy of) the original data.
with(df1, plot(Catholic, Fertility, col=edu))
#par: set or query graphical parameters
defaultpar <- par()
par(mfrow = c(1,2), mar = c(5,4,2,1))
with(df1, plot(Catholic, Fertility, col=edu))
with(df1, plot(Infant.Mortality, Fertility, col=edu))
par(defaultpar)
plot(cars)
plot(lowess(cars))
#LOWESS: Locally Weighted Scatterplot Smoothing
#it is a popular tool used in regression analysis that creates a smooth line through a
#timeplot or scatter plot to help you to see relationship between variables and foresee trends.


#Lattice
xyplot(Fertility ~ Education | cat, data = df1, layout = c(4,2))
bwplot(Fertility ~ Catholic | edu, data = df1)
#did not get the output for xyplot n bwplot


#ggplot2
df1 <- df1[order(df1$Catholic),]
plot(df1$Catholic, df1$Education)
lines(df1$Catholic, df1$Fertility)
ylim = c(0,100)
type = "n"
with(subset(df1, Education = 7), points(Catholic, Agriculture ))
col = "red"
pch = 4


#Saving graph
pdf(file = "lec8.pdf")
hist(x)
title(main = "hi")
dev.off()

?Devices
jpeg, png, bmp,

