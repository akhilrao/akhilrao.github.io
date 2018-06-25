cendat <- as.matrix(read.csv("data.csv"))

people <- c(as.numeric(cendat[1,5]),as.numeric(cendat[1,8]),as.numeric(cendat[1,2]))
names(people) <- c("Hindu pop", "Muslim pop", "Total pop")

hinmus <- t(as.matrix(people))

intot.47 <- 390000000
paktot.47 <- 30000000
paktot.11 <- 176200000
intot.11 <- 1221000000

inmus.47 <- 0.099
inhin.47 <- 1 - inmus.47
pakhin.47 <- 0.15
pakmus.47 <- 1- pakhin.47

inmus.11 <- 0.177
inhin.11 <- 1-inmus.11
pakhin.11 <- 0.012
pakmus.11 <- 1-pakhin.11

hins.pak.47 <- pakhin.47*paktot.47
mus.pak.47 <- pakmus.47*paktot.47
hins.pak.11 <- pakhin.11*paktot.11
mus.pak.11 <- pakmus.11*paktot.11

hins.in.47 <- inhin.47*intot.47
mus.in.47 <- inmus.47*intot.47
hins.in.11 <- inhin.11*intot.11
mus.in.11 <- inmus.11*intot.11

hins.pak.diff <- (hins.pak.11 - hins.pak.47)/hins.pak.47
mus.pak.diff <- (mus.pak.11 - mus.pak.47)/mus.pak.47

hins.in.diff <- (hins.in.11 - hins.in.47)/hins.in.47
mus.in.diff <- (mus.in.11 - mus.in.47)/mus.in.47

