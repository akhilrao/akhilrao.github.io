## Bellman equations for on the job labor search
set.seed <- 100

utility <- function(cons,leisure){
    utility <- log(cons) + phi*log(leisure)
}

# Employed worker, uniform wage distribution
z <- 0.00000001
B <- 100
#w <- runif(1,1,B)
w <- seq(1,B)
phi <- 0.5
b <- 0.99
leisure.notsearch <- phi/(1+phi)
leisure.search <- phi/(1+phi) - (phi*z)/(w*(1+phi))
Ven.w <- rep(0,length=length(w))
Ves.w <- rep(0,length=length(w))


Ven.body <- function(w,...){
value<-utility((1/(1-b))*w*(1-leisure.notsearch),leisure.notsearch)
lookup.table <- matrix(0,nrow=length(Ves.w.body))
return(value)
}

Ven <- (1/(1-b))*Ven.body(w)

Ves.body <- function(w,...){
    value<-as.vector(utility(as.vector(w[j:B]*t(1-leisure.search[j:B])-z),leisure.search[j:B]))
    return(value)
}

Ves <- rep(0,length=length(Ven))
search.int <- rep(0,length=length(Ven))

for (i in 1:B) {

    for (j in i:B) {
        search.int[i] <- max(sum(Ven[j:B]),sum(Ves.body(w))) - max(sum(Ven.body(w[i]),Ves.body(w[i:i])))
        }
    Ves[i] <- (1/(1-b))*Ves.body(w[i])
}

Ve.w <- max(Ven.w,Ves.w)