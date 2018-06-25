##### An experiment to compare the coefficients recovered by OLS to those recovered by LASSO

library(glmnet)

rm(list=ls())
set.seed <- 102030 #for reproducibility
n_covs <- 25 #number of covariates
n_obs <- 100 #number of observations
seeds <- runif(n_covs,min=0,max=1) #uniform draws for numbers to plug into sines in X

#### The DGP  
step <- seq(from=1,to=n_obs,by=1) #time step 
X <- matrix(0,nrow=n_obs,ncol=n_covs) #matrix to store sines in columns
for (i in 1:n_covs){ #loop over columns to create n_covs many deterministic regressors
X[,i] <- sinpi(seeds[i]*step) #sines - deterministic regressors
}

#### The Y variable
Y <- X[,1] + 3*X[,2] - 5*X[,3] + 7*X[,4] - 9*X[,5] + 11*X[,6] + rnorm(n_obs) #linear combination of sines + gaussian noise

#### OLS fit
olsfit <- lm(Y ~ X)
summary(olsfit)
ols_coefs <- coef(olsfit) #store coefficients from this run

#### LASSO fit
lassofit <- cv.glmnet(x=X,y=Y,alpha=1,nlambda=100)
lasso_min <- coef(lassofit, s = "lambda.min", exact = FALSE) #store coefficients
lasso_1se <- coef(lassofit, s = "lambda.1se", exact = FALSE) #store coefficients
