#  cleans water entitlement/allocation trading data

# read in entitlements data
ent_data <- read_excel("tradehistory.xlsx",sheet="Entitlements")

# time variables
ent_data$dates <- as.Date(ent_data$DateOfTrade,format="%d/%m/%Y")
ent_data$year <- as.numeric(format(ent_data$dates,'%Y'))

# "state" variables
##from
from_state <- character(length = dim(ent_data)[1])
vic <- c(grep(":vic",ent_data$TradeFromIdent),grep(":victoria",ent_data$TradeFromIdent))
wa <- grep(":wa",ent_data$TradeFromIdent)
qld <- c(grep(":qld",ent_data$TradeFromIdent),grep(":queensland",ent_data$TradeFromIdent))
nsw <- c(grep(":nsw",ent_data$TradeFromIdent),grep(":newsouthwales",ent_data$TradeFromIdent))
sa <- c(grep(":sa",ent_data$TradeFromIdent),grep("SA",ent_data$TradeFromIdent))
tas <- grep(":tas",ent_data$TradeFromIdent)
from_state[vic] <- "vic"
from_state[wa] <- "wa"
from_state[qld] <- "qld"
from_state[nsw] <- "nsw"
from_state[sa] <- "sa"
from_state[tas] <- "tas"
##to
to_state <- character(length = dim(ent_data)[1])
vic <- c(grep(":vic",ent_data$TradeToIdent),grep(":victoria",ent_data$TradeToIdent))
wa <- grep(":wa",ent_data$TradeToIdent)
qld <- c(grep(":qld",ent_data$TradeToIdent),grep(":queensland",ent_data$TradeToIdent))
nsw <- c(grep(":nsw",ent_data$TradeToIdent),grep(":newsouthwales",ent_data$TradeToIdent))
sa <- c(grep(":sa",ent_data$TradeToIdent),grep("SA",ent_data$TradeToIdent))
tas <- grep(":tas",ent_data$TradeToIdent)
to_state[vic] <- "vic"
to_state[wa] <- "wa"
to_state[qld] <- "qld"
to_state[nsw] <- "nsw"
to_state[sa] <- "sa"
to_state[tas] <- "tas"
##interstate
interstate <- rep(0,length=dim(ent_data)[1])
interstate[which(from_state!=to_state)] <- 1


# "state" dummies
statedums <- matrix(0,nrow=dim(ent_data)[1],ncol=6)
colnames(statedums) <- c("vic","wa","qld","nsw","sa","tas")
statedums[from_state=="vic",1] <- 1
statedums[from_state=="wa",2] <- 1
statedums[from_state=="qld",3] <- 1
statedums[from_state=="nsw",4] <- 1
statedums[from_state=="sa",5] <- 1
statedums[from_state=="tas",6] <- 1

# "mdb" variable
mdb <- rep(0,length=dim(ent_data)[1])
toMatch_nsw_mdb <- c("uppermurrumbidgee", "farwest", "lachlan", "lowerdarling", "macquarie","murrumbidgee", "barwon","murray")
toMatch_qld_mdb <- c("borderrivers","condamineandbalonne","warrego","paroo","bullooandnebine")
toMatch_sa_mdb <- c("murray")
toMatch_vic_mdb <- c("alexandra","broken","campaspe","goulburn","katunga","kinglake","loddon","loddonhighlands","lowercampaspevalley","lowerovens","midgoulburn","midloddon","mullindolingong","ovens","sheppartonirrigation","strathbogie","unincorporated","uppergoulburn","upperovens","murray") #whither central victorian mineral springs?
nsw_mdb <- unique(intersect(grep(paste(toMatch_nsw_mdb,collapse="|"),ent_data$TradeFromIdent),which(from_state=="nsw")))
qld_mdb <- unique(intersect(grep(paste(toMatch_qld_mdb,collapse="|"),ent_data$TradeFromIdent),which(from_state=="qld")))
sa_mdb <- unique(intersect(grep(paste(toMatch_sa_mdb,collapse="|"),ent_data$TradeFromIdent),which(from_state=="sa")))
vic_mdb <- unique(intersect(grep(paste(toMatch_vic_mdb,collapse="|"),ent_data$TradeFromIdent),which(from_state=="vic")))
mdb[c(nsw_mdb,qld_mdb,sa_mdb,vic_mdb)] <- 1

# "product type" variables
groundwater <- rep(0,length=dim(ent_data)[1])
river <- rep(0,length=dim(ent_data)[1])
surfacewater <- rep(0,length=dim(ent_data)[1])
regulated <- rep(0,length=dim(ent_data)[1])
groundwater[grep("Groundwater",ent_data$ProductName)] <- 1
river[c(grep("River",ent_data$ProductName),grep("river",ent_data$ProductName))] <- 1
surfacewater[c(grep("surface water",ent_data$ProductName),grep("Surface water",ent_data$ProductName))] <- 1
regulated[c(grep("regulated",ent_data$ProductName),grep("Regulated",ent_data$ProductName))] <- 1
productdummies <- cbind(groundwater,river,surfacewater,regulated)

# zero price transactions
ent_data$zerop <- rep(0,length=dim(ent_data)[1])
ent_data$zerop[which(ent_data$netPrice==0)] <- 1

# put it all together
ent_data_aug <- cbind(ent_data,from_state,to_state,interstate,statedums,mdb,productdummies)

# output to csv
write.csv(ent_data_aug, file="entitlements_aug.csv")

########################################################
########################################################


# clear stuff out
rm(list=ls())
# read in allocation data
alloc_data <- read_excel("tradehistory.xlsx",sheet="Allocations")

# time variables
alloc_data$dates <- as.Date(alloc_data$DateOfTrade,format="%d/%m/%Y")
alloc_data$year <- as.numeric(format(alloc_data$dates,'%Y'))

# "state" variables
##from
from_state <- character(length = dim(alloc_data)[1])
vic <- c(grep(":vic",alloc_data$TradeFromIdent),grep(":victoria",alloc_data$TradeFromIdent))
wa <- grep(":wa",alloc_data$TradeFromIdent)
qld <- c(grep(":qld",alloc_data$TradeFromIdent),grep(":queensland",alloc_data$TradeFromIdent))
nsw <- c(grep(":nsw",alloc_data$TradeFromIdent),grep(":newsouthwales",alloc_data$TradeFromIdent))
sa <- c(grep(":sa",alloc_data$TradeFromIdent),grep("SA",alloc_data$TradeFromIdent),grep(":southaustralia",alloc_data$TradeFromIdent))
tas <- grep(":tas",alloc_data$TradeFromIdent)
from_state[vic] <- "vic"
from_state[wa] <- "wa"
from_state[qld] <- "qld"
from_state[nsw] <- "nsw"
from_state[sa] <- "sa"
from_state[tas] <- "tas"
##to
to_state <- character(length = dim(alloc_data)[1])
vic <- c(grep(":vic",alloc_data$TradeToIdent),grep(":victoria",alloc_data$TradeToIdent))
wa <- grep(":wa",alloc_data$TradeToIdent)
qld <- c(grep(":qld",alloc_data$TradeToIdent),grep(":queensland",alloc_data$TradeToIdent))
nsw <- c(grep(":nsw",alloc_data$TradeToIdent),grep(":newsouthwales",alloc_data$TradeToIdent))
sa <- c(grep(":sa",alloc_data$TradeToIdent),grep("SA",alloc_data$TradeToIdent))
tas <- grep(":tas",alloc_data$TradeToIdent)
to_state[vic] <- "vic"
to_state[wa] <- "wa"
to_state[qld] <- "qld"
to_state[nsw] <- "nsw"
to_state[sa] <- "sa"
to_state[tas] <- "tas"
##interstate
interstate <- rep(0,length=dim(alloc_data)[1])
interstate[which(from_state!=to_state)] <- 1

# "state" dummies
statedums <- matrix(0,nrow=dim(alloc_data)[1],ncol=6)
colnames(statedums) <- c("vic","wa","qld","nsw","sa","tas")
statedums[from_state=="vic",1] <- 1
statedums[from_state=="wa",2] <- 1
statedums[from_state=="qld",3] <- 1
statedums[from_state=="nsw",4] <- 1
statedums[from_state=="sa",5] <- 1
statedums[from_state=="tas",6] <- 1

# "mdb" variable
mdb <- rep(0,length=dim(alloc_data)[1])
toMatch_nsw_mdb <- c("uppermurrumbidgee", "farwest", "lachlan", "lowerdarling", "macquarie","murrumbidgee", "barwon","murray")
toMatch_qld_mdb <- c("borderrivers","condamineandbalonne","warrego","paroo","bullooandnebine")
toMatch_sa_mdb <- c("murray")
toMatch_vic_mdb <- c("alexandra","broken","campaspe","goulburn","katunga","kinglake","loddon","loddonhighlands","lowercampaspevalley","lowerovens","midgoulburn","midloddon","mullindolingong","ovens","sheppartonirrigation","strathbogie","unincorporated","uppergoulburn","upperovens","murray") #whither central victorian mineral springs?
nsw_mdb <- unique(intersect(grep(paste(toMatch_nsw_mdb,collapse="|"),alloc_data$TradeFromIdent),which(from_state=="nsw")))
qld_mdb <- unique(intersect(grep(paste(toMatch_qld_mdb,collapse="|"),alloc_data$TradeFromIdent),which(from_state=="qld")))
sa_mdb <- unique(intersect(grep(paste(toMatch_sa_mdb,collapse="|"),alloc_data$TradeFromIdent),which(from_state=="sa")))
vic_mdb <- unique(intersect(grep(paste(toMatch_vic_mdb,collapse="|"),alloc_data$TradeFromIdent),which(from_state=="vic")))
mdb[c(nsw_mdb,qld_mdb,sa_mdb,vic_mdb)] <- 1

# "product type" variables
groundwater <- rep(0,length=dim(alloc_data)[1])
river <- rep(0,length=dim(alloc_data)[1])
surfacewater <- rep(0,length=dim(alloc_data)[1])
regulated <- rep(0,length=dim(alloc_data)[1])

groundwater[c(grep("Groundwater",alloc_data$ProductName),grep("Ground Water",alloc_data$ProductName),grep("Underground Water",alloc_data$ProductName))] <- 1

river[c(grep("River",alloc_data$ProductName),grep("river",alloc_data$ProductName))] <- 1

surfacewater[unique(c(grep("Surface water",alloc_data$ProductName),grep("Surface Water",alloc_data$ProductName)))] <- 1

regulated[c(grep("regulated",alloc_data$ProductName),grep("Regulated",alloc_data$ProductName))] <- 1
productdummies <- cbind(groundwater,river,surfacewater,regulated)

# zero price transactions
alloc_data$zerop <- rep(0,length=dim(alloc_data)[1])
alloc_data$zerop[which(alloc_data$netPrice==0)] <- 1

# put it all together
alloc_data_aug <- cbind(alloc_data,from_state,to_state,interstate,statedums,mdb,productdummies)

#drop incorrect year observations
alloc_data_aug <- alloc_data_aug[-c(which(alloc_data_aug$year>2014)),]

# output to csv
write.csv(alloc_data_aug, file="allocations_aug.csv")


############################################################
############################################################
rm(list=ls())
# read in data

ents <- read.csv("entitlements_aug.csv")
alls <- read.csv("allocations_aug.csv")
