library(ggplot2)
library(gridExtra)

rm(list=ls())

# economic parameters
A <- 10
B <- 2
c <- 5

# ecological parameters
K <- 100
r <- 10

# open access hunting rate
H <- function(c,r,K,...) {
	X <- B*K/r
	Y <- A*K/r + B*K
	Z <- A*K - c
	#rate_1 <- (1/2*X)*(Y + sqrt(Y^2 - 4*X*Z)) # drop this solution because it increases in the cost - economically weird!
	rate_2 <- (1/2*X)*(Y - sqrt(Y^2 - 4*X*Z))
	rates <- c(rate_2)
	return(rates)
}

# HADES statics
c_seq <- seq(from=1,to=51,by=1)
r_seq <- seq(from=5,to=55,by=1)

HADES_statics <- as.data.frame(cbind(c_seq,H(c_seq,r,K),r_seq,H(c,r_seq,K)))
colnames(HADES_statics) <- c("cost","hunt_c","renew","hunt_r")

cost_change <- ggplot(data=HADES_statics) + geom_line(aes(x=cost,y=hunt_c),size=1) + ggtitle("Effect of changing c") + xlab("Marginal cost of machine hunting") + ylab("Number of machines hunted") + theme_bw()
renew_change <- ggplot(data=HADES_statics) + geom_line(aes(x=renew,y=hunt_r),size=1) + ggtitle("Effect of changing r") + xlab("Rate of machine production") + ylab("Number of machines hunted") + theme_bw()

grid.arrange(cost_change,renew_change,ncol=2)

# GAIA statics
K_seq <- seq(from=90,to=140,by=1)

GAIA_statics  <- as.data.frame(cbind(K_seq,H(c,r,K_seq)))
colnames(GAIA_statics) <- c("capacity","hunt_K")

capacity_change <- ggplot(data=GAIA_statics) + geom_line(aes(x=capacity,y=hunt_K),size=1) + ggtitle("Effect of changing K") + xlab("Environment's machine-carrying capacity") + ylab("Number of machines hunted") + theme_bw()
capacity_change
