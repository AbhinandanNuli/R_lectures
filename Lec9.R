#Lecture 9

#ggplot

df1 <- swiss
#In many data analysis settings, it might be useful to break up a continuous variable such as 
#age into a categorical variable. Or, you might want to classify a categorical variable like 
#year into a larger bin, such as 1990-2000.
#for simple displays of demographic data in tables, "cut" command could make sense

df1$cat <- cut(df1$Catholic, 5) #as the no. increases, the interval becomes small.. basically it divides the "whole interval" into as many smaller intervals as we mention there, like 5 in this case

library(ggplot2)
qplot(data=df1, x=Fertility)
qplot(data=df1, x=Fertility, y=Education, color=cat)
qplot(data=df1, x=Fertility, y=Education, log="xy", color=cat)
qplot(data=df1, x=log(Fertility), y=log(Education), color=cat)
qplot(data=df1, x=Fertility, y=Education, geom="boxplot",color=cat)
qplot(data=df1, x=Fertility, y=Education, color=cat, facets = cat ~ Examination)
qplot(data=df1, x=Fertility, y=Education, color=cat, facets = ~ Examination)
g1 <- qplot(data=df1, x=Fertility, y=Education, color=cat, facets = ~ cat)
g1 <- g1 + stat_smooth(method = "lm")
g1
ggsave("g1.jpg")


#ggplot2 - 2

ggplot(df1, aes(x=Fertility)) + geom_histogram()
df1$state <- row.names(df1)
ggplot(subset(df1, Education %in% c(1,2,3,4,5,6,7,8,9)),
         aes(x=state, y=Fertility, color=cat)) + geom_point()
g1 <- ggplot(data=df1,aes( x=Education, y=Fertility))
g1 + geom_point(aes(color = cat))
modelF <- lm(Fertility ~ Education, data = df1)
df1$guessF <- predict(modelF)
g1 + geom_line(aes(y=df1$guessF))
g1 + geom_smooth()
g1 + geom_text(aes(label=state))
# if you use library ggrepel then g1 + geom_text_repel(aes(label=state))

#ggplot2 - 3
g1 <- ggplot(data=df1,aes( x=Education, y=Fertility))
g1 + geom_point(aes(color = Agriculture, shape = cat))
g1 <- ggplot(data =df1, aes(x=Agriculture, y=Fertility))
g1 + geom_line(aes(color = cat))
g1 + geom_line() + facet_wrap(~ cat, ncol = 2) + theme_classic()
g1 <- g1 + geom_line() + facet_wrap(~ cat, ncol = 2)
theme_new <- theme_bw() +
   theme(plot.background = element_rect(size = 1, color = "blue", fill = "purple"),
       text=element_text(size = 12, color = "ivory"), axis.text.y = element_text(colour = "grey"),
       axis.text.x = element_text(colour = "white"), panel.background = element_rect(fill = "lightblue"),
       strip.background = element_rect(fill = "orange"))
g1 + theme_new

#dplyr
x %>% f(y) is translated into f(x, y).
filter(
  summarise(
    select(
      group_by(rock, perm),
      area, peri
    ),
    aveArea = mean(area, na.rm = TRUE),
    avePeri = mean(peri, na.rm = TRUE)
  ),
  aveArea > 7000 | avePeri > 4000
)
rock %>%
  group_by(perm) %>%
  select(area, peri) %>%
  summarise(
    aveArea = mean(area, na.rm = TRUE),
    avePeri = mean(peri, na.rm = TRUE)
  ) %>%
  filter(aveArea > 7000 | avePeri > 4000)












