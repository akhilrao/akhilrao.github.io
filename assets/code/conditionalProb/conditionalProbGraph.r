# Graphs for conditional probabilities

# assumptions
event.a <- 10
event.b <- 5
population <- 100
P.b.given.a <- seq(0,1,by=0.01)

P.a <- event.a/population
P.b <- event.b/population
Odds <- P.a/P.b

P.a.given.b <- P.b.given.a*Odds
P.a.given.b

# Probability of event A given event B by assumed probability of event B given event A and estimated odds
plot(P.a.given.b,type="l",main="Probability of A given B",xlab="Assumed P(B|A)",ylab="P(A|B)",ylim=c(0,0.5))

ones <- rep(1,length=length(P.a.given.b))

pmin(P.a.given.b,ones)
