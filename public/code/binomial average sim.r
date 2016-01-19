rm(list=ls())


rX <- function(n,p) {
U <- runif(n)
X <- rep(0,n)

x1 <- which(U<=p[1])
X[x1] <- 1

x2 <- which(U>p[1])
X[x2] <- 2

return(X)
}

n <- 2000
p <- c(0.5,0.5)

averages <- rep(0,n)

for(i in 1:n) {
X <- rX(i,p)
averages[i] <- (1/i)*sum(X)
}

plot(averages,type="l")
abline(h=1.5)
