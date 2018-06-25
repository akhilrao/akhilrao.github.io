# feature library for snowboarding analysis algorithms

suppressMessages(library(data.table))
suppressMessages(library(stringr))
suppressMessages(library(zoo))
suppressMessages(library(sandwich))
suppressMessages(library(kernlab))
suppressMessages(library(signal))
suppressMessages(library(dtt))



#decomposes acceleration magnitude into contributions from each axis and an averaged residual term
ADR <- function(panel) {
    X <- as.data.frame(cbind(panel$acceleration.x,panel$acceleration.y,panel$acceleration.z))
    names(X) <- c("ax","ay","az")
    Y <- panel$acceleration.magnitude
    model <- lm(Y ~ ax + ay + az, data=X)
    model.betas <- coefficients(model)
    model.resid.avg <- mean(as.vector(resid(model)))
    model.info <- as.vector(c(model.betas,model.resid.avg))
    return(model.info)
}

# the first numFreqs dominant frequencies for a single sensor element timeseries
domfreqs <- function(timeseries, winSize, numFreqs, OverlapStep, norm, sourcename) {

	n_samples<-length(timeseries)
	
	if(OverlapStep > 0) {
		Overlap <- floor((OverlapStep*winSize)/100)
		nFrames <- floor(n_samples/Overlap) - 1
	} else {
		Overlap <- winSize
		nFrames <- floor(n_samples/Overlap) - 100
	}
	
	Entropy <- rep(0,nFrames) # it needs to be a column vec!
	
	k <- 1
	inc <- 1 # 100?

	while ( (k+winSize-1) <= n_samples ) {
		FrameSignal <- timeseries[k:(k+winSize-1)]
		v <- FrameSignal * hanning(length(FrameSignal))
		N <- length(v)
		Y <- fft(v)
		
		sqrtPyy <- ((sqrt(abs(Y)*abs(Y))*2)/N)
		sqrtPyy <- sqrtPyy [1:(winSize/2)]
		
		d <- sqrtPyy
		d.scaled <- d*(50/128)
		domFreqs <- c(d.scaled)
		if (inc==1) {domfreqs.dfrm <- rbind(domFreqs[1:numFreqs])}
		if (inc>1) {domfreqs.dfrm <- rbind(domfreqs.dfrm,domFreqs[1:numFreqs])}
		k <- k + Overlap
		inc <- inc + 1
	}
	
    domfreqs.dfrm <- as.data.frame(domfreqs.dfrm)
    
    
    for (i in 1:numFreqs) {
        names(domfreqs.dfrm)[i] <- paste(sourcename,"domfreq",i,sep=".")
    }
    names(Entropy) <- paste(sourcename,"entropy",sep=".")
    
    featureVector <- domfreqs.dfrm
	return(featureVector)
}

# converts a matrix of lists to a matrix of numerics
listToMatrix <- function(panel.list) {
    panel.matrix <- matrix(data=NA,nrow=dim(panel.list)[1],ncol=dim(panel.list)[2])
    for (i in 1:ncol(panel.list)) {
        panel.matrix[,i] <- c(as.numeric(panel.list[,i]))
    }
    colnames(panel.matrix) <- colnames(panel.list)
    
    return(panel.matrix)
}

# computes the features in windows
features <- function(panel) {
    n <- dim(panel)[1]
    win.length <- 32
    nwindows <- floor(n/win.length)
    local.feature.panel <- list()
    
    OverlapStep <- 100
    Overlap <- (OverlapStep*win.length)/100
    numFreqs<- 6
    ptm <- proc.time()
    entropy.features <- cbind(domfreqs(panel$rotationrate.x,win.length,numFreqs,OverlapStep,0,"rotr.x"),domfreqs(panel$rotationrate.y,win.length,numFreqs,OverlapStep,0,"rotr.y"),domfreqs(panel$rotationrate.z,win.length,numFreqs,OverlapStep,0,"rotr.z"))
    write(paste("Done. Time taken: ", round((proc.time()-ptm)[3],4), " seconds",sep=""),stderr())
    
    ptm <- proc.time()
    write(paste("Computing local features..."),stderr())
    for (i in 0:(nwindows-1)) {
        regtm <- proc.time()
        window.panel <- as.data.frame(cbind(panel$acceleration.magnitude[(i*win.length+1):(i*win.length+win.length)],panel$acceleration.x[(i*win.length+1):(i*win.length+win.length)],panel$acceleration.y[(i*win.length+1):(i*win.length+win.length)],panel$acceleration.z[(i*win.length+1):(i*win.length+win.length)]))
        colnames(window.panel) <- c("acceleration.magnitude","acceleration.x","acceleration.y","acceleration.z")
        
        feature.row <- ADR(window.panel)
        local.feature.panel <- rbind(local.feature.panel,feature.row)

        #write(paste("Row",i,"completed, time taken:",round((proc.time()-regtm)[3],4),"seconds",sep=" "),stderr())
    }
    colnames(local.feature.panel) <- c("adr.intercept","adr.beta.x","adr.beta.y","adr.beta.z","adr.resid")
    rownames(local.feature.panel) <- c()
    write(paste("Done. Time taken: ", round((proc.time()-ptm)[3],4), " seconds",sep=""),stderr())

    feature.panel <- cbind(local.feature.panel,entropy.features)
    return(feature.panel)  
}
