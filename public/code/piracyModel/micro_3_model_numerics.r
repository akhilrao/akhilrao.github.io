#Numerical analysis of the piracy-multiplayer model

# Plot of convergence
rm(list=ls())

v <- 0.5
b.1 <- 0.5
b.2 <- seq(from=0,to=1,by=0.01)
tc <- 0.1
mc <- 0.1
th.1 <- seq(from=0,to=1,by=0.01)
th.2 <- 0.5

pi.u.1 <- ((th.1*v + tc*(1-th.1))^2)/(4*tc*(2-th.1)) + ((b.1-mc)^2)/(2*tc)
pi.b.1 <- ((b.1 + th.1*v + tc*(1-th.1)-mc)^2)/(4*tc*(2-th.1))

pi.u.2 <- ((th.2*v + tc*(1-th.2))^2)/(4*tc*(2-th.2)) + ((b.2-mc)^2)/(2*tc)
pi.b.2 <- ((b.2 + th.2*v + tc*(1-th.2)-mc)^2)/(4*tc*(2-th.2))

win.graph()
par(mfrow=c(2,1))
plot(pi.u.1,type="l",main="Bundled and unbundled profits",xlab="theta",ylim=c(min(pi.b.1,pi.u.1),max(pi.b.1,pi.u.1)),ylab="Profits", xaxt="n", lwd=1,col=1)
axis(1, at=c(1,50,100), labels=seq(from=0,to=1,by=0.5))
lines(pi.b.1,col=2)

plot(pi.u.2,type="l",main="",xlab="beta",ylim=c(min(pi.b.2,pi.u.2),max(pi.b.2,pi.u.2)),ylab="Profits", xaxt="n", lwd=1,col=1)
axis(1, at=c(1,50,100), labels=seq(from=0,to=1,by=0.5))
lines(pi.b.2,col=2)
