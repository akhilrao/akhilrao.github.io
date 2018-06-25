# function to bootstrap HMMs estimated over large number of observations. crude.

HMM.bootstrap <- function(panel,numStates) {
    ptm <- proc.time()
    
    seed.n <- 100
    seed <- floor((runif(min=0,max=1,n=1))*10000)
    
    nRows <- dim(panel)[2]
    
    # the seed HMM, estimated at seed:seed+seed.n 
    seed.HMM <- HMMFit(panel[seed:(seed+seed.n),7], nStates=numStates, control=list(verbose=1))
    init <- seed.HMM$HMM$initProb
    tpm <- seed.HMM$HMM$transMat
    means <- seed.HMM$HMM$distribution$mean
    vars <- seed.HMM$HMM$distribution$var
    
    # the bootstrapping window parameters
    increment <- 1500
    n <- dim(panel)[1]
    num.iterations <- floor(n/increment)
    
    # the bootstrapping loop
    for(i in 1:num.iterations) {
        looptm <- proc.time()
        init.HMM <- HMMSet(init,tpm,dis="NORMAL",mean=means,var=vars)

        updated.HMM<-HMMFit(panel[1:i*increment,], nStates=3, control=list(init='USER',verbose=1,initPoint=init.HMM))
        
        init <- updated.HMM$HMM$initProb
        tpm <- updated.HMM$HMM$transMat
        means <- updated.HMM$HMM$distribution$mean
        vars <- updated.HMM$HMM$distribution$var
        write(paste("Iteration ",i," complete. Time taken: ", round((proc.time()-looptm)[3],4), " seconds",sep=""),stderr())
    }
    write(paste("HMM fitting complete. Total time taken: ", round((proc.time()-ptm)[3],4), " seconds",sep=""),stderr())
    
    return(updated.HMM)
}
