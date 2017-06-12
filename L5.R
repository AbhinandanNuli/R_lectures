#grep string

l1 <- c("Foo ", " foo", "Go", "abcd")
grep("foo",l1, value = T)
grep("^foo",l1, value = T)
grep("foo$",l1, value = T)
grep("[F,f]oo", l1, value=T)
grep("foo", l1, value=T, ignore.case = F)
grep("^[F,f]oo",l1,value = T)
grep("[F,f]oo$",l1,value = T)
grep("[a,e,i,o,u]",l1,value = T)
grep(".[a,e,i,o,u]",l1,value = T)
grep("o[^o]",l1,value = T)
grep("[^o]o$",l1,value = T)



#Array Definition

a1<-array(c(1:15,21:25),dim = c(3,2,4))
a1
a1<-array(c(1:15,21:25),dim = c(3,2,4),dimnames = list(c("r1","r2","r3"),c("c1","c2"),c("m1","m2","m3","m4")))
a1
dimnames(a1)
dimnames(a1)[[1]]
dimnames(a1)[[1]][3]
dimnames(a1)[[1]][2]<-"R2"

#assignment<-convert all row names to capitals in single command

dimnames(a1)<-list(c("R1","R2","R3"),c("C1","C2"),c("M1","M2","M3","M4"))


#Array access

a1[,,2]
a1[,1,2]
a1[,"C1","M2"]
subset(a1,"c2">3,select = c("c1"))
a1

#assignment<-try apply function on each dimension of a1
apply(a1,1,mean)
apply(a1,1,sum)

#revision assignment
HEC<-HairEyeColor
HEC

Total_pop<-sum(HEC)
Total_pop
dHEC<-dimnames(HEC)
dHEC
LikeH<-grep("r",dHEC[[1]])
LikeH
LikeH<-grep("r",dHEC[[1]], value = T)
LikeH
LikeH<-grep("r",dHEC[[1]], value = T, ignore.case = T)
LikeH
LikeE<-grep("^B",dHEC[["Eye"]])
LikeE
LikeE<-grep("^B",dHEC[["Eye"]], value = F)
LikeE
LikeH<-grep("r",dHEC[["Hair"]], value = T, ignore.case = T)
LikeH
Selected<-sum(HEC[LikeH,LikeE,])
Selected
100 * Selected/Total_pop


# skipping "Saving" slide.. its not of much use


# Saving Env

a<-"A"
b<-22
save(a,b,file = "ab")
rm(a)
rm(b)
b<-24
load("ab")
save(list = ls(all=T),file = "all.RData")
load("all.RData")
all.RData
b<-26



#text files

oFile


