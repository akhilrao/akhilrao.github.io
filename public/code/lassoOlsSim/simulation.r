##### A monte carlo simulation to compare the coefficients recovered by OLS to those recovered by LASSO

#### load files
setwd("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/lassoOlsSim")
library(glmnet)

#### Simulation function
rm(list=ls())
set.seed <- 102030 #for reproducibility

lasso_ols_mc <- function(n_covs, n_obs, n_iter) {
    seeds <- runif(100,min=0,max=1) #uniform draws for numbers to plug into sines in X
    ### initialize coefficient storage
    ols_coefs <- rep(0,length=n_covs)
    lasso_min <- rep(0,length=n_covs)

    for(j in 1:n_iter) { #monte carlo loop  
    #### The DGP  
      seeds_sample <- sample(seeds, n_covs, replace=FALSE) #random sample from the seeds... not super reproducible :(
      step <- seq(from=1,to=n_obs,by=1) #time step 
      X <- matrix(0,nrow=n_obs,ncol=n_covs) #matrix to store sines in columns
      for (i in 1:n_covs){ #loop over columns to create n_covs many deterministic regressors
        X[,i] <- sinpi(seeds_sample[i]*step) #sines - deterministic regressors
      }
      
    #### The Y variable
      Y <- X[,1] + 3*X[,2] - 5*X[,3] + 7*X[,4] - 9*X[,5] + 11*X[,6] + rnorm(n_obs) #linear combination of sines + gaussian noise
      
    #### OLS fit
      olsfit <- lm(Y ~ X)
      summary(olsfit)
      ols_coefs <- rbind(ols_coefs,as.matrix(coef(olsfit))[2:(n_covs+1),1]) #store coefficients from this run
      
    #### LASSO fit
      lassofit <- cv.glmnet(x=X,y=Y,alpha=1,nlambda=100)
      lasso_min <- rbind(lasso_min,as.numeric(coef(lassofit, s = "lambda.min", exact = FALSE)[2:(n_covs+1),1])) #store coefficients from this run

    }

    #### Cleaning up a bit
    ols_coefs <- as.data.frame(ols_coefs[-1,], row.names=as.character(seq(1:dim(ols_coefs)[1])))
    lasso_min <- as.data.frame(lasso_min[-1,], row.names=as.character(seq(1:dim(lasso_min)[1])))

    #### Return list of coefficients
    coefs <- list()
    coefs[[1]] <- ols_coefs
    coefs[[2]] <- lasso_min

    return(coefs)
}

save.image("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/lassoOlsSim/simulation.Rdata")

#### Calculate means
#load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/lassoOlsSim/simulation.Rdata")
#coefs <- lasso_ols_sim(25,100,1000)
#ols_coefs <- coefs[[1]]
#lasso_min <- coefs[[2]]
#options(scipen=100,digits=4) #trying to make output a little clearer
#colMeans(ols_coefs)
#colMeans(lasso_min)

