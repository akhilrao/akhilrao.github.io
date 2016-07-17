
#### Histograms of the relevant coefficients
### OLS coefficients
ols_x1 <- ggplot(ols_coefs,aes(x=ols_coefs$X1)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(ols_coefs$X1)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=1), color="blue", linetype="dashed", size=1)
ols_x2 <- ggplot(ols_coefs,aes(x=ols_coefs$X2)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(ols_coefs$X2)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=3), color="blue", linetype="dashed", size=1)
ols_x3 <- ggplot(ols_coefs,aes(x=ols_coefs$X3)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(ols_coefs$X3)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=-5), color="blue", linetype="dashed", size=1)
ols_x4 <- ggplot(ols_coefs,aes(x=ols_coefs$X4)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(ols_coefs$X4)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=7), color="blue", linetype="dashed", size=1)
ols_x5 <- ggplot(ols_coefs,aes(x=ols_coefs$X5)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(ols_coefs$X5)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=-9), color="blue", linetype="dashed", size=1)
ols_x6 <- ggplot(ols_coefs,aes(x=ols_coefs$X6)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(ols_coefs$X6)), color="red", linetype="dashed", size=1) + geom_vline(aes(xintercept=11), color="blue", linetype="dashed", size=1)

### LASSO minlambda coefficients
lasso_min_x1 <- ggplot(lasso_min,aes(x=lasso_min$V1)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_min$V1)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=1), color="blue", linetype="dashed", size=1)
lasso_min_x2 <- ggplot(lasso_min,aes(x=lasso_min$V2)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_min$V2)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=3), color="blue", linetype="dashed", size=1)
lasso_min_x3 <- ggplot(lasso_min,aes(x=lasso_min$V3)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_min$V3)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=-5), color="blue", linetype="dashed", size=1)
lasso_min_x4 <- ggplot(lasso_min,aes(x=lasso_min$V4)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_min$V4)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=7), color="blue", linetype="dashed", size=1)
lasso_min_x5 <- ggplot(lasso_min,aes(x=lasso_min$V5)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_min$V5)), color="red", linetype="dashed", size=1)+ geom_vline(aes(xintercept=-9), color="blue", linetype="dashed", size=1)
lasso_min_x6 <- ggplot(lasso_min,aes(x=lasso_min$V6)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_min$V6)), color="red", linetype="dashed", size=1) + geom_vline(aes(xintercept=11), color="blue", linetype="dashed", size=1)

### LASSO 1selambda coefficients
lasso_1se_x1 <- ggplot(lasso_1se,aes(x=lasso_1se$X1)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_1se$X1)), color="red", linetype="dashed", size=1)
lasso_1se_x2 <- ggplot(lasso_1se,aes(x=lasso_1se$X2)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_1se$X2)), color="red", linetype="dashed", size=1)
lasso_1se_x3 <- ggplot(lasso_1se,aes(x=lasso_1se$X3)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_1se$X3)), color="red", linetype="dashed", size=1)
lasso_1se_x4 <- ggplot(lasso_1se,aes(x=lasso_1se$X4)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_1se$X4)), color="red", linetype="dashed", size=1)
lasso_1se_x5 <- ggplot(lasso_1se,aes(x=lasso_1se$X5)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_1se$X5)), color="red", linetype="dashed", size=1)
lasso_1se_x6 <- ggplot(lasso_1se,aes(x=lasso_1se$X6)) + geom_histogram(binwidth=0.1) + geom_vline(aes(xintercept=mean(lasso_1se$X6)), color="red", linetype="dashed", size=1)

### multiplot
## OLS multiplot
multiplot(ols_x1,ols_x2,ols_x3,ols_x4,ols_x5,ols_x6,cols=2)

## LASSO_min multiplot
multiplot(lasso_min_x1,lasso_min_x2,lasso_min_x3,lasso_min_x4,lasso_min_x5,lasso_min_x6,cols=2)

## LASSO_1se multiplot
multiplot(lasso_1se_x1,lasso_1se_x2,lasso_1se_x3,lasso_1se_x4,lasso_1se_x5,lasso_1se_x6,cols=2)
