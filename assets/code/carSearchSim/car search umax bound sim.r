## Simulating the worst case and expected utility bounds for the used car search problem on 10/08/2015

beta.v <- 0.99
N.start <- 1
N.end <- 20000

beta.hat <- rep(50,N.end)
beta.n <- rep(50,N.end)

for(i in N.start:N.end) {
beta.hat[i] <- (1/2)*(beta.v/i)*((1-(beta.v^i))/(1-beta.v))
beta.n[i] <- (1/2)*beta.v^i
}

plot(beta.n,type="l",col=2,main="cost bounds for one search: beta = 0.99",ylab="cost must be less than",xlab="number of sellers")
lines(beta.hat,col=4)
