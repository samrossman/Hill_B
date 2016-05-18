setwd("C:\\Users\\samro\\OneDrive\\Hill_B")
setwd("C:\\Users\\rossm_000\\SkyDrive\\Hill_B")
table1<-read.csv("Nonresident Analysis Table A.csv",header=TRUE)
table2<-read.csv("Nonresident Analysis Table B.csv",header=TRUE)
data<-cbind(table1,table2[,10:183])
sp<-colnames(data)

X<-NA
for (i in 10:363){
  species<-strsplit(sp[i],"[.]")[[1]][1]
  time<-strsplit(sp[i],"[.]")[[1]][2]
  temp<-cbind(data[,1:9],species,time,data[,i])
  X<-rbind(X,temp)
}
X<-X[complete.cases(X),]

species.code<-as.data.frame(cbind(levels(as.factor(X$species)),levels(as.factor(as.numeric(X$species)))))
control.code<-as.data.frame(cbind(levels(as.factor(X$Treatment)),levels(as.factor(as.numeric(X$Treatment)))))
obs.code<-as.data.frame(cbind(levels(as.factor(X$Observer)),levels(as.factor(as.numeric(X$Observer)))))

Y<-X$`data[, i]`
species<-X$species
obs<-X$Observer
run<-X$Run
site<-X$Site
time<-X$time
effect<-X$Treatment


N[] <- b0 + b1*species[s] + time[t] + obs[o] + effect[e]