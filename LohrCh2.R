#STAT461 Advanced Survey Sampling Lohr Notes Ch2

#We can draw a simple random sample of size n from
#a population of size N in R by the following commands:

n=25
N=500
sample(N,n,replace=FALSE)

#Agent Orange Example
agent.orange.data=read.table("agent_orange_data.txt", header=TRUE)
dioxin=agent.orange.data$dioxin
mean(dioxin)
sd(dioxin)
hist(dioxin,
     main="Histogram of Dioxin",
     xlim=c(1, 50),
     ylim=c(0,1000))

mode = function(x){
	ux = unique(x)
	ux[which.max(tabulate(match(x,ux)))]
}

mode(dioxin)