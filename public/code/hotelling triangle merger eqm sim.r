compute.eqm <- function(v,travel.cost,marginal.cost) {
### Variable values
#v <- 10
#travel.cost <- 5
#marginal.cost <- 5

### demands and prices
p1 <- v - (1/2)*marginal.cost - (1/6)*travel.cost - (1/6)
p2 <- (1/4)*(2*v + 2*marginal.cost - travel.cost + 1)
p3 <- v + (1/2)*marginal.cost - (5/6)*travel.cost + (1/6)

x13 <- (1/travel.cost)*(v-p1)
x23 <- (1/(2*travel.cost))*(p3-p2+travel.cost)
x12 <- (1/(2*travel.cost))*(p2-p1+travel.cost)

p3_p1 <- 2*v - p1 - travel.cost # should be the same as p3

pi1 <- (p1-marginal.cost)*(x13+x12) + (p3-marginal.cost)*(2-x13-x23)
pi2 <- (p2-marginal.cost)*(1-x12) + (p2-marginal.cost)*(x23)

eqm <- c(p1,p2,p3,x12,x13,x23,pi1,pi2)
names(eqm) <- c("p1","p2", "p3", "x12", "x13", "x23", "pi1", "pi2")
eqm <- round(eqm,digits=2)
return(eqm)
}

## eqm as t varies
v<-1
marginal.cost<-0.01
eqm.t <- list()
t.start <- 0.01
t.end <- v-5*marginal.cost
t.seq <- seq(t.start,t.end,0.005)
for(i in t.seq) {
    eqm.t[[which(t.seq==i)]] <- compute.eqm(v,i,marginal.cost)
}
eqm.t.mat <- do.call(rbind,eqm.t)
eqm.t.mat <- cbind(eqm.t.mat,t.seq)
colnames(eqm.t.mat)[9] <- "travel.cost"
eqm.t.df <- as.data.frame(eqm.t.mat)


win.graph()
par(mfcol=c(3,3))
plot(eqm.t.df$pi1,main="Profits as t increases",ylim=c(min(eqm.t.df$pi1,eqm.t.df$pi2),max(eqm.t.df$pi1,eqm.t.df$pi2)),ylab="Profits",xlab="travel cost",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(t.seq)),labels=t.seq,tick=TRUE)
lines(eqm.t.df$pi2,col=4)
abline(h=0)
plot(eqm.t.df$p1,main="Prices as t increases",ylim=c(min(eqm.t.df$p1,eqm.t.df$p2,eqm.t.df$p3),max(eqm.t.df$p1,eqm.t.df$p2,eqm.t.df$p3)),ylab="Prices",xlab="travel cost",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(t.seq)),labels=t.seq,tick=TRUE)
lines(eqm.t.df$p2,col=4)
lines(eqm.t.df$p3,col=6)
plot(eqm.t.df$x12,main="X as t increases",ylim=c(min(eqm.t.df$x12,eqm.t.df$x13,eqm.t.df$x23),max(eqm.t.df$x12,eqm.t.df$x13,eqm.t.df$x23)),ylab="Location",xlab="travel cost",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(t.seq)),labels=t.seq,tick=TRUE)
lines(eqm.t.df$x13,col=4)
lines(eqm.t.df$x23,col=6)
abline(h=0)
abline(h=1)


## eqm as c varies
v<-1
travel.cost<-0.25
eqm.c <- list()
c.start <- 0.001
c.end <- 0.1
c.seq <- seq(c.start,c.end,0.001)
for(i in c.seq) {
    eqm.c[[which(c.seq==i)]] <- compute.eqm(v,travel.cost,i)
}
eqm.c.mat <- do.call(rbind,eqm.c)
eqm.c.mat <- cbind(eqm.c.mat,c.seq)
colnames(eqm.c.mat)[9] <- "marginal.cost"
eqm.c.df <- as.data.frame(eqm.c.mat)

#win.graph()
#par(mfrow=c(3,1))
plot(eqm.c.df$pi1,main="Profits as c increases",ylim=c(min(eqm.c.df$pi1,eqm.c.df$pi2),max(eqm.c.df$pi1,eqm.c.df$pi2)),ylab="Profits",xlab="marginal cost",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(c.seq)),labels=c.seq,tick=TRUE)
lines(eqm.c.df$pi2,col=4)
abline(h=0)
plot(eqm.c.df$p1,main="Prices as c increases",ylim=c(min(eqm.c.df$p1,eqm.c.df$p2,eqm.c.df$p3),max(eqm.c.df$p1,eqm.c.df$p2,eqm.c.df$p3)),ylab="Prices",xlab="marginal cost",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(c.seq)),labels=c.seq,tick=TRUE)
lines(eqm.c.df$p2,col=4)
lines(eqm.c.df$p3,col=6)
plot(eqm.c.df$x12,main="X as c increases",ylim=c(min(eqm.c.df$x12,eqm.c.df$x13,eqm.c.df$x23),max(eqm.c.df$x12,eqm.c.df$x13,eqm.c.df$x23)),ylab="Location",xlab="marginal cost",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(c.seq)),labels=c.seq,tick=TRUE)
lines(eqm.c.df$x13,col=4)
lines(eqm.c.df$x23,col=6)
abline(h=0)
abline(h=1)


## eqm as v varies
travel.cost<-0.25
marginal.cost<-0.02
eqm.v <- list()
v.start <- 0.5
v.end <- 1.5
v.seq <- seq(v.start,v.end,0.01)
for(i in v.seq) {
    eqm.v[[which(v.seq==i)]] <- compute.eqm(i,travel.cost,marginal.cost)
}
eqm.v.mat <- do.call(rbind,eqm.v)
eqm.v.mat <- cbind(eqm.v.mat,v.seq)
colnames(eqm.v.mat)[9] <- "valuation"
eqm.v.df <- as.data.frame(eqm.v.mat)

#win.graph()
#par(mfcol=c(3,1))
plot(eqm.v.df$pi1,main="Profits as v increases",ylim=c(min(eqm.v.df$pi1,eqm.v.df$pi2),max(eqm.v.df$pi1,eqm.v.df$pi2)),ylab="Profits",xlab="consumer's valuation",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(v.seq)),labels=v.seq,tick=TRUE)
lines(eqm.v.df$pi2,col=4)
abline(h=0)
plot(eqm.v.df$p1,main="Prices as v increases",ylim=c(min(eqm.v.df$p1,eqm.v.df$p2,eqm.v.df$p3),max(eqm.v.df$p1,eqm.v.df$p2,eqm.v.df$p3)),ylab="Prices",xlab="consumer's valuation",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(v.seq)),labels=v.seq,tick=TRUE)
lines(eqm.v.df$p2,col=4)
lines(eqm.v.df$p3,col=6)
plot(eqm.v.df$x12,main="X as v increases",ylim=c(min(eqm.v.df$x12,eqm.v.df$x13,eqm.v.df$x23),max(eqm.v.df$x12,eqm.v.df$x13,eqm.v.df$x23)),ylab="Location",xlab="consumer's valuation",col=2,type="l",xaxt="n")
axis(side=1,at=seq(1,length(v.seq)),labels=v.seq,tick=TRUE)
lines(eqm.v.df$x13,col=4)
lines(eqm.v.df$x23,col=6)
abline(h=0)
abline(h=1)

