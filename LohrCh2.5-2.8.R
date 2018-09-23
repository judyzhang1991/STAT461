#STAT461 Advanced Survey Sampling Lohr Notes Ch2.5-2.8

#Set working directory
setwd("/Users/JudyZhang/Documents/Work/GitRepo/STAT425")


#Pilot sample for Agent Organge data

#Agent Orange Example
agent.orange.data=read.table("agent_orange_data.txt", header=TRUE)
dioxin=agent.orange.data$dioxin
N=646
pilotsamplesize=20
pilotsample=sample(N,pilotsamplesize, replace=FALSE)
s.pilotsample=sd(dioxin[pilotsample])
s.pilotsample

#Specify a margin of error we would like
e=0.25
#Calculate n using the sample standard deviation s.pilotsample

nhat=(1.96^2*s.pilotsample^2)/(1.96^2*s.pilotsample^2/N+e^2)
nhat

#Sample the remaining needed observations from the population
#that the units already sampled in the pilot sample
full.sample.size=ceiling(nhat)
full.sample.size
remaining.sample.size=full.sample.size-pilotsamplesize

#Continue sampling to get the remaining sample 
remainingsample=sample(seq(1,N,1)[-pilotsample],remaining.sample.size,replace=FALSE)

#Combine pilot and remaining sample to get full sample
fullsample=c(dioxin[pilotsample],dioxin[remainingsample])

fullsample

#Calculate the mean, standard deviation of the full sample
mean.fullsample=mean(fullsample)
s.fullsample=sd(fullsample)       

#Calculate the standarded error, lower CI and upper CI of the full sample
se.ybar=sqrt((s.fullsample^2/full.sample.size)*(1-full.sample.size/N))
lowerci=mean.fullsample-1.96*se.ybar
upperci=mean.fullsample+1.96*se.ybar


s.fullsample
full.sample.size
nhat
mean.fullsample
se.ybar
lowerci
upperci

#Get population mean and standard deviation
mean.popl=mean(dioxin)
mean.popl
s.popl=sd(dioxin)
s.popl

#Calculate the width of the CI
#Round upper and lower ci to 2 decimal places
upperci=round(upperci, 2)
lowerci=round(lowerci, 2)


ciwidth=upperci-lowerci

ciwidth

actual.marginoferror = ciwidth/2

actual.marginoferror 

#actual.marginoferror is 0.29 which is about the margin of error e=0.25 that we would like to have
