source("featurelibSnow.r",echo=T)
source("HMMbootstrapper")
library(RHmm)
library(sfsmisc)

data <- read.csv("dataset_574.csv")
data.core <- as.data.frame(c(data[,1:6],data[,19:21]))
feature.set <- features(data.core)

#fit HMMs
HMM.USL <- HMM.bootstrap(feature.set,6)
HMM.output <- viterbi(HMM.USL,feature.set)

