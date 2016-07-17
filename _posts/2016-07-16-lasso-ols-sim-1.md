---
layout: post
title: Looking at LASSO - parameter estimation in a contrived example
category: econometrics
tags: econometrics, simulation, lasso, ols, regression, machine learning
year: 2016
month: 07
day: 17
published: true
summary: Some simulation results comparing LASSO and OLS estimators in small samples
---

I've been thinking about LASSO a lot over the last few months. I first heard about [LASSO over at Gelman's blog](http://andrewgelman.com/?s=LASSO) a few years ago (I can't remember the exact post), but didn't follow most of the discussion or spend much time trying. I didn't really understand what the fuss was about until last semester, when my econometrics professor showed me some papers in spatial econometrics using LASSO ([this one by Elena Manresa](http://www.cireqmontreal.com/wp-content/uploads/2015/02/manresa.pdf) and [this one by Cliff Lam and Pedro Souza](http://stats.lse.ac.uk/lam/RSPT.pdf)). I've been going through those posts again since then, and regularized regressions are now the coolest thing to me since the HydroFlask.

I visited some relatives in northwest Karnataka with my dad last week with limited internet/distractions, and finally threw together a LASSO simulation I've been thinking about. My goal was to see how LASSO's parameter estimation compares to OLS's. I don't have any new results; everything here has been derived or discussed in greater detail somewhere else. This post is to convince myself of some of LASSO's properties relative to OLS without doing derivations, to get familiar with the `glmnet` package, and to procrastinate on other work I should be doing.

## What is the LASSO?

The idea with OLS is to estimate the model $$ Y = X \beta + \epsilon $$ by solving

$$ \min_{\beta} (Y - X \beta)^2 $$

This results in an estimator for $$ \beta $$ which is [unbiased, consistent, and even efficient under certain conditions](https://en.wikipedia.org/wiki/Gauss%E2%80%93Markov_theorem). It's easy to compute and interpret, its assumptions and inferential properties are well-studied... it's pretty much the first model taught in a lot of econometrics classes and the first tool applied economists reach for to estimate things.

The idea with LASSO is to add a penalty to the problem that is increasing in the dimension of the coefficient vector $$ \beta$$, i.e. to solve

$$ \min_{\beta} (Y - X \beta)^2 + \lambda \| \beta \|_1 $$

where $$ \| \beta \|_1 $$ is the $$L1$$ norm of the vector $$\beta$$. $$\lambda$$ is a parameter that controls how severe the penalty for a higher-dimensional or larger $$\beta$$ is - bigger $$\lambda$$ means a sparser model. It is typically tuned through cross-validation. This procedure results in a [biased](https://arxiv.org/pdf/0808.0967.pdf) but [consistent](http://www.jmlr.org/papers/volume7/zhao06a/zhao06a.pdf) estimator of $$\beta$$. 

Note that the consistency described in the Zhao paper at the "consistent" link is not the same consistency that econometricians usually speak of in regard to OLS; the former is model selection consistency, the latter is parameter estimation consistency. The Zhao paper has some discussion of this distinction, and refers to [Knight and Fu (2000) ](http://www.stat.rice.edu/~gallen/knight_fu_2000_lasso.pdf) for proofs of estimation consistency and asymptotic properties of a class of regularized estimators which include LASSO as a special case.

That's all I'll say about LASSO here. There's a lot of discussion of the LASSO online. Rob Tibshirani has a good introduction with references [here](http://statweb.stanford.edu/~tibs/lasso.html), the [wikipedia page](https://en.wikipedia.org/wiki/Lasso_(statistics) ) is also decent, and googling will turn up a lot more resources.

## Simulations

I used R's `glmnet` package to run the LASSO estimations. My main reference was [this vignette](https://cran.r-project.org/web/packages/glmnet/vignettes/glmnet_beta.html) by Trevor Hastie and Junyang Qian, supplemented by some searches that I can't remember now.

### DGP and code

This is how I made the data generating process:

1. draw 100 "seeds" $$\omega_i$$ from a uniform distribution over $$[0,1]$$
2. sample `n_covs` of these seeds to generate sines $$X_i = \sin(\omega_i t)$$, where $$t$$ runs from 1 to `n_obs`
3. put these sines together in a matrix $$X$$, and generate a dependent variable $$Y = X_1 + 3 X_2 - 5 X_3 + 7 X_4 - 9 X_5 + 11 X_6 + R$$, where $$R ~ N(0,1)$$ is a standard normal random variable to add a little noise

This gives me a bunch of randomly initialized deterministic regressors and a noisy linear combination of a few of them. Since OLS is unbiased and consistent, it should estimate the coefficients of the $$X_i$$s correctly. Since there are only 100 observations it probably won't be super precise but on average it should still be close.

For each number of covariates, I estimated OLS and LASSO regressions 1000 times from steps 2 and 3, storing the coefficients in a matrix. My R code below might make this process clearer.


{% highlight r %}
library(glmnet)

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
{% endhighlight %}

The coefficient storage could have been done more elegantly and I don't like those `rbind()` calls... but effort is costly and this is produced under scarcity.

Anyway, the function `lasso_ols_mc()` takes three arguments: `n_covs`, the number of covariates to generate; `n_obs`, the number of observations to generate; `n_iter`, the number of iterations to run. It returns a list with two dataframes of dimension `n_iter` by `n_covs`: the first is the OLS coefficients, and the second is the LASSO coefficients. The code is in the file `simulation.r` [here](https://github.com/akhilrao/akhilrao.github.io/tree/master/public/code/lassoOlsSim).

Note: I'm using `cv.glmnet()` instead of `glmnet()` to get the estimated coefficients from the penalization parameter $$\lambda$$ which minimizes the cross-validated errors. This [stack exchange post](http://stats.stackexchange.com/questions/77546/how-to-interpret-glmnet) has a good discussion of the use of `cv.glmnet()` versus `glmnet()` and how that relates to $$\lambda$$.

### Simulation 1: 25 covariates


{% highlight r %}
library(glmnet)
load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/lassoOlsSim/simulation.Rdata")

sim_25 <- lasso_ols_mc(25,100,1000)

ols_coefs <- sim_25[[1]]
lasso_min <- sim_25[[2]]
options(scipen=100,digits=4) #I like decimal notation
colMeans(ols_coefs)
{% endhighlight %}



{% highlight text %}
##        X1        X2        X3        X4        X5        X6        X7 
##   0.84575   2.79689  -5.39146   6.91616 -10.39828  11.14851   0.23271 
##        X8        X9       X10       X11       X12       X13       X14 
##  -0.16579   0.25008   0.06273   0.60091  -0.50771   0.14841   0.18313 
##       X15       X16       X17       X18       X19       X20       X21 
##  -0.48205   0.06443   0.22578   0.33808   0.80858  -1.80170  -1.01977 
##       X22       X23       X24       X25 
##   0.98723   0.30708   1.78747   0.07162
{% endhighlight %}



{% highlight r %}
colMeans(lasso_min)
{% endhighlight %}



{% highlight text %}
##         V1         V2         V3         V4         V5         V6 
##  0.8551006  2.8313675 -4.7997349  6.7857505 -8.7650122 10.7999512 
##         V7         V8         V9        V10        V11        V12 
##  0.0112456  0.0081712  0.0058198 -0.0007110 -0.0009387  0.0024224 
##        V13        V14        V15        V16        V17        V18 
##  0.0081600 -0.0045956 -0.0002659  0.0052694  0.0081007  0.0034213 
##        V19        V20        V21        V22        V23        V24 
##  0.0003531  0.0076995  0.0004855  0.0120161  0.0125994  0.0056955 
##        V25 
##  0.0058837
{% endhighlight %}

The first 6 numbers should be +1, +3, -5, +7, -9, +11, and all the rest should be 0. OLS and LASSO are both close on the first 6, with LASSO a little closer on the rest.

### Simulation 2: 50 covariates


{% highlight r %}
library(glmnet)
load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/lassoOlsSim/simulation.Rdata")

sim_50 <- lasso_ols_mc(50,100,1000)

ols_coefs <- sim_50[[1]]
lasso_min <- sim_50[[2]]
options(scipen=100,digits=4) #I like decimal notation
colMeans(ols_coefs)
{% endhighlight %}



{% highlight text %}
##        X1        X2        X3        X4        X5        X6        X7 
##    45.621   -39.780    -7.825  -109.538 -1566.738   -19.541   118.284 
##        X8        X9       X10       X11       X12       X13       X14 
##    -4.013   -67.543   -59.812  -147.680    30.056  -227.749   189.434 
##       X15       X16       X17       X18       X19       X20       X21 
##    -8.550    35.778  -173.203   -44.160    27.836   -32.681    56.185 
##       X22       X23       X24       X25       X26       X27       X28 
##  -112.021   -48.255     1.190    48.058   -57.421   -67.878   279.999 
##       X29       X30       X31       X32       X33       X34       X35 
##     9.445    66.104     5.706   108.343     5.123     7.835  -168.868 
##       X36       X37       X38       X39       X40       X41       X42 
##    14.550    34.462    58.293   185.393   -31.833    18.288  1964.648 
##       X43       X44       X45       X46       X47       X48       X49 
##   -10.704   -72.467   177.646  -294.309    42.899        NA  -340.436 
##       X50 
##   175.847
{% endhighlight %}



{% highlight r %}
colMeans(lasso_min)
{% endhighlight %}



{% highlight text %}
##         V1         V2         V3         V4         V5         V6 
##  0.8015310  2.7677204 -4.7082946  6.6515331 -8.6152915 10.6241727 
##         V7         V8         V9        V10        V11        V12 
##  0.0130475  0.0008572  0.0124773  0.0002354  0.0095255  0.0112302 
##        V13        V14        V15        V16        V17        V18 
## -0.0021430  0.0076620  0.0008248  0.0020195  0.0016123  0.0021281 
##        V19        V20        V21        V22        V23        V24 
##  0.0021809  0.0028006  0.0122234  0.0115460  0.0021777  0.0034436 
##        V25        V26        V27        V28        V29        V30 
## -0.0031613  0.0086550  0.0061313  0.0149392  0.0016341  0.0014897 
##        V31        V32        V33        V34        V35        V36 
##  0.0089855  0.0115552  0.0050156  0.0148793  0.0016785 -0.0067179 
##        V37        V38        V39        V40        V41        V42 
##  0.0063458  0.0048662  0.0099795  0.0131269  0.0038804 -0.0015681 
##        V43        V44        V45        V46        V47        V48 
## -0.0009201  0.0020819  0.0059797  0.0012738  0.0069779  0.0040313 
##        V49        V50 
##  0.0086625  0.0026937
{% endhighlight %}

The first 6 numbers should be +1, +3, -5, +7, -9, +11, and all the rest should be 0. OLS is being a little silly now... LASSO is close on the first 6, and solid on the rest.

### Simulation 3: 75 covariates


{% highlight r %}
library(glmnet)
load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/lassoOlsSim/simulation.Rdata")

sim_75 <- lasso_ols_mc(75,100,1000)

ols_coefs <- sim_75[[1]]
lasso_min <- sim_75[[2]]
options(scipen=100,digits=4) #I like decimal notation
colMeans(ols_coefs)
{% endhighlight %}



{% highlight text %}
##        X1        X2        X3        X4        X5        X6        X7 
##   34430.4  -63493.0  -87764.5    8139.2   -3973.4   77824.9    7663.7 
##        X8        X9       X10       X11       X12       X13       X14 
##  229655.9   -9961.2   53668.5    1506.1   84036.2  -97414.8 -200738.6 
##       X15       X16       X17       X18       X19       X20       X21 
##  -94069.3    7208.0  -17470.4    3016.7  -33336.0  112707.8  -74305.2 
##       X22       X23       X24       X25       X26       X27       X28 
##  -57560.4  -12128.7 -212583.1  196011.4   14389.8  145308.5  -21893.7 
##       X29       X30       X31       X32       X33       X34       X35 
##   16574.2  -33854.0   53555.7     715.7  -31256.4  -59375.7  -50588.8 
##       X36       X37       X38       X39       X40       X41       X42 
##  147967.5  -10886.2   22279.1  -62503.2  -30260.0  -11028.0  -63481.6 
##       X43       X44       X45       X46       X47       X48       X49 
##    -487.8    8418.9  -37660.0    4863.7  197359.9   22782.4  -48267.1 
##       X50       X51       X52       X53       X54       X55       X56 
##    5194.4   70943.0   13752.5     328.8   10425.9  -15728.8    1447.4 
##       X57       X58       X59       X60       X61       X62       X63 
##        NA        NA   -5695.4        NA        NA        NA        NA 
##       X64       X65       X66       X67       X68       X69       X70 
##        NA        NA        NA        NA        NA        NA        NA 
##       X71       X72       X73       X74       X75 
##        NA        NA        NA        NA        NA
{% endhighlight %}



{% highlight r %}
colMeans(lasso_min)
{% endhighlight %}



{% highlight text %}
##          V1          V2          V3          V4          V5          V6 
##  0.74985507  2.67795119 -4.57457239  6.57015556 -8.51695515 10.53733526 
##          V7          V8          V9         V10         V11         V12 
##  0.01334905  0.00757007  0.00078230 -0.00277604  0.01200334 -0.00109266 
##         V13         V14         V15         V16         V17         V18 
##  0.00281474 -0.00030673  0.00028960  0.00372971  0.00086233 -0.00947773 
##         V19         V20         V21         V22         V23         V24 
## -0.00504350  0.00167887  0.00731918  0.01227472  0.00333442  0.00653620 
##         V25         V26         V27         V28         V29         V30 
##  0.00472042  0.00918587  0.00877708 -0.00272863 -0.00129686  0.00784940 
##         V31         V32         V33         V34         V35         V36 
## -0.00596610  0.00628460  0.00388768  0.01356444  0.00592269 -0.00004759 
##         V37         V38         V39         V40         V41         V42 
##  0.00371287  0.00170037  0.00625622  0.00320188  0.00325778  0.00603352 
##         V43         V44         V45         V46         V47         V48 
##  0.00319677  0.00579496  0.00106068  0.01256782  0.01092158  0.01242250 
##         V49         V50         V51         V52         V53         V54 
##  0.00192769 -0.00797062  0.00446120  0.00478225  0.00569254  0.01142434 
##         V55         V56         V57         V58         V59         V60 
##  0.01072754  0.00495753  0.00329634  0.00429706  0.00331320  0.00041993 
##         V61         V62         V63         V64         V65         V66 
## -0.00057534  0.00516571  0.00664865  0.00994866  0.00271078  0.00925352 
##         V67         V68         V69         V70         V71         V72 
##  0.00785356 -0.00154720  0.00700347 -0.00048195 -0.00261776  0.00690537 
##         V73         V74         V75 
##  0.00469327  0.00113490 -0.00432958
{% endhighlight %}

The first 6 numbers should be +1, +3, -5, +7, -9, +11, and all the rest should be 0. Go home OLS, you're drunk.

## Discussion

From the results above, it looks like OLS and LASSO are both reasonable choices when the number of covariates $$p$$ is small relative to the sample size $$n$$. LASSO does a better job of estimating irrelevant covariates as 0 - I don't see how OLS could do as well there. My understanding is that LASSO sets some coefficients to 0 because of the kink in the objective function that the $$L1$$ penalty adds at 0. The OLS objective function is smooth through 0, so it seems like it should always keep every predictor, even if they're estimated as really tiny values with big standard errors. 

Where LASSO really shines is when $$p$$ starts getting larger relative to $$n$$. In the second and third simulations, OLS produces some pretty ridiculous parameter estimates for both the relevant and irrelevant predictors, while LASSO stays on point - the estimates always have the correct sign and the correct order of magnitude. This [Stack Exchange post](http://stats.stackexchange.com/questions/82466/why-use-lasso-estimates-over-ols-estimates-on-variable-subset) has a good discussion of when to use LASSO vs OLS for variable selection. To be fair the sines I generated as covariates are probably fairly correlated on average, so there's most likely some collinearity messing with the OLS estimates (I think this is what's going on with all the NAs).

So where and how is LASSO used in economics? I hear it's not uncommon in financial economics, and I know it's being applied in spatial econometrics. But I haven't seen it in the mainstream of applied fields like labor, development, or environmental economics (where reduced-form methods seem to be preferred). There, from what I've seen, OLS and IV approaches continue to dominate. Why might this be the case?

Spatial is more of a tool-building area than a topic area like financial so simulations can be relevant to the questions of interest, but it makes spatial a less-apt comparison to fields like labor or development. Let's leave it aside for this discussion. If you're interested in the two spatial econometrics papers using LASSO I referenced at the beginning of this post, I wrote a brief review for that class which might be useful (or not). You can find it [here](https://github.com/akhilrao/akhilrao.github.io/tree/master/public/code/lassoOlsSim/akhil_rao_8838_writeup_final.pdf).

Financial has lots of really good data, e.g. high-frequency stock price data, so it makes sense to me that there would be a lot of scope for "fancier" econometrics there. My limited understanding of the questions studied in financial is that they tend to focus more on prediction than policy evaluation, reducing the "interpretability advantage" of OLS over other methods. So this might be a factor that limits adoption outside of financial. Jim Savage has [some interesting comments](http://andrewgelman.com/2015/09/29/how-to-use-lasso-etc-in-political-science/#comment-244882) in this regard. (As an aside, Jim Savage's random forest proximity weighting paper mentioned in that comment got me stoked about random forests all over again. Someday I might blog about that, it's super cool.)

Data quality in other applied fields is a mixed bag. Labor has lots of high-quality data, but development folks I know tell me development doesn't. In environmental it seems to depend on the question. I don't know much about industrial organization and trade, but I know they tend to use more "fancy" econometrics there than elsewhere. The preference for structural vs. reduced-form methods also plays a role in this, but in general I think many researchers in applied fields care more about policy evaluation than prediction.

In some applied fields, I know that there's a strong preference for unbiased parameter estimates. I think this might be a factor in limiting the use of regularized regression methods in those fields. By trading off some of the variance for bias the LASSO estimates tend to be better controlled than OLS estimates, though the bias could be a downside to folks who really like unbiased estimates. 

However, I think this could actually work in LASSO's favor, since the estimates are biased *toward 0* (you can see this in the simulation tables, and it's mentioned in the Stack Exchange post a few paragraphs up). This means that the LASSO estimates are *lower bounds* on the effect size for a given policy evaluation question! I think this could be a selling point for using LASSO in applied/policy-centric questions since it lets the researcher say something like "look, the effect of this policy is *at least* 5 whatevers, and possibly a little more".

Models can easily blow up when you're controlling for a lot of things - individual fixed effects, for example, can add a lot of predictors to a model. The applied folks I know tend to say they care more/entirely about the parameter estimate of the policy variable and not the fixed effects, but just having the fixed effects in the model can reduce the precision of the estimates of interest. LASSO might be a good approach for such settings. That said, I don't know if the estimates could still be interpreted as "controlling for" the unobservables being captured by the fixed effects, since the fixed effects might be set to 0 if they aren't sufficiently correlated with the outcome. Does this mean those effects didn't need to be controlled for?

Significance testing is another advantage for OLS over LASSO in applied economics. There are a lot of results out there about significance testing for OLS, and folks understand them (or at least, think they do, which is the same for adoption purposes). Inference under LASSO is a current area of research, and apparently Tibshirani recently came out with [a significance test for the LASSO](http://statweb.stanford.edu/~tibs/ftp/covtest-talk.pdf) (I really like the [discussion of this over at Gelman's blog](http://andrewgelman.com/2013/03/18/tibshirani-announces-new-research-result-a-significance-test-for-the-lasso/)).

At some point I'd like to try a "LASSO difference-in-differences with fixed effects" simulation to see how that goes.
