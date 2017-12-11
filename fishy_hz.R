# look at fin beat stuff....

# David L Miller 5 December 2017



hz <- read.csv("FishVO2Hz.csv")

# make codes for the speeds
hz$speedcode <- "H"
hz$speedcode[hz$speed == 0.5] <- "L"
hz$speedcode[hz$speed == 1.5] <- "M"
# speeds set at 0.5, 1.5 and then the max that got data for both turbulent
# and laminar flows. (Measured in bodylengths/s of course)


library(ggplot2)

# quick visualisation
p <- ggplot(hz) +
  #geom_point(aes(x=speed, y=VO2minBac, colour=cond)) +
  geom_point(aes(x=PecHz, y=VO2minBac, colour=cond)) +
  theme_minimal() +
  facet_wrap(~Fish)
print(p)


# let's fit a GAM!
library(mgcv)
# this is fitting a model that says:
# O2 varies as a function of pectoral hz, but we should estimate a different
# curve for each condition. We also think that fish acts like a random effect
b_pec <- gam(VO2minBac~s(PecHz, cond, bs="fs") + s(Fish, bs="re"),
              data=hz, method="REML")

# check this model
gam.check(b_pec)
# looks like there might be a minor issue with heteroskedasticity? probably not
# worth worrying about (top right). Looks like the model predicts well (bottom
# right). Residuals look normal enough (left side). Text output shows that we let
# our model be wiggly enough
summary(b_pec)
# v. high % deviance explained, maybe the fish random effect is not super-relevant
# but we can include anyway as we think there is between-fish variability


# now to make predictions, make a grid of values with all the pectoral hz we need
# plus values for the condition and fish
preddat <- expand.grid(PecHz = seq(0.5, 3.5, by=0.1),
                       cond  = c("T", "L"),
                       Fish  = unique(hz$Fish))

# make predictions, also predict the standard error
pr <- predict(b_pec, preddat, type="response", se=TRUE)
preddat$VO2minBac <- pr$fit
# generate the CIs
preddat$upper <- pr$fit + 2*pr$se.fit
preddat$lower <- pr$fit - 2*pr$se.fit


# what does that look like?
p <- ggplot(hz) +
  geom_line(aes(x=PecHz, y=VO2minBac, colour=cond, group=cond), data=preddat) +
  geom_line(aes(x=PecHz, y=upper, colour=cond, group=cond), linetype=2, data=preddat) +
  geom_line(aes(x=PecHz, y=lower, colour=cond, group=cond), linetype=2, data=preddat) +
  geom_text(aes(x=PecHz, y=VO2minBac, colour=cond, label=speedcode)) +
  scale_colour_brewer(type="qual") +
  theme_minimal() +
  labs(x="Pectoral Hz", colour="Condition") +
  facet_wrap(~Fish, nrow=2)

print(p)

# ignore fish and predict excluding the fish random effect
preddat <- expand.grid(PecHz = seq(0.5, 3.5, by=0.1),
                       cond  = c("T", "L"), Fish="F5")
pr <- predict(b_pec, preddat, type="response", se=TRUE, exclude="s(Fish)")
preddat$VO2minBac <- pr$fit
preddat$upper <- pr$fit + 2*pr$se.fit
preddat$lower <- pr$fit - 2*pr$se.fit

# what does that look like?
p <- ggplot(hz) +
  geom_line(aes(x=PecHz, y=VO2minBac, colour=cond, group=cond), data=preddat) +
  geom_line(aes(x=PecHz, y=upper, colour=cond, group=cond), linetype=2, data=preddat) +
  geom_line(aes(x=PecHz, y=lower, colour=cond, group=cond), linetype=2, data=preddat) +
  geom_text(aes(x=PecHz, y=VO2minBac, colour=cond, label=speedcode)) +
  scale_colour_brewer(type="qual") +
  theme_minimal() +
  labs(x="Pectoral Hz", colour="Condition")

print(p)






# what about caudal fin?
# quick visualisation
p <- ggplot(hz) +
  geom_point(aes(x=CaudHz, y=VO2minBac, colour=cond)) +
  theme_minimal() +
  facet_wrap(~Fish)

print(p)

# try the same kind of model as above for the caudal?
# need to reduce k (smooth complexity) as we don't have many unique values
b_caud <- gam(VO2minBac~s(CaudHz, cond, bs="fs", k=5) + s(Fish, bs="re"),
              data=hz, method="REML")

# model check
summary(b_caud)
# less deviance explained than before and less wiggly effects?
plot(b_caud)
# do we believe that O2 is n-shaped in caudal hz?


preddat <- expand.grid(CaudHz = seq(0, 5, by=0.1),
                       cond  = c("T", "L"),
                       Fish  = unique(hz$Fish))

preddat$VO2minBac <- predict(b_caud, preddat, type="response")


p <- ggplot(hz) +
  geom_line(aes(x=CaudHz, y=VO2minBac, colour=cond, group=cond), data=preddat) +
  geom_text(aes(x=CaudHz, y=VO2minBac, colour=cond, label=speedcode)) +
  scale_colour_brewer(type="qual") +
  theme_minimal() +
  labs(x="Caudal Hz", colour="Condition")# +
#  facet_wrap(~Fish, nrow=2)

print(p)





# FANCY MODELS
#
#b_use <- gam(VO2minBac~s(PecHz, CaudHz, cond,
#                         bs="fs", k=10, xt="tp") +
#                       s(Fish, bs="re"),
#              data=hz, method="REML")
#
#
#
#par(mfrow=c(1,2))
#hist(hz$PecHz)
#hist(hz$CaudHz)
#
#
#
#preddat <- expand.grid(PecHz  = seq(0, 3.5, len=100),
#                       CaudHz = seq(0, 5, len=100),
#                       cond   = c("T", "L"),
#                       Fish   = unique(hz$Fish))
#
#preddat$VO2minBac <- predict(b_use, preddat, type="response", exclude="s(Fish)")
#
#
## YIKES plotting
#
#pred_yikes <- preddat
#
#
#library(viridis)
#
#p <- ggplot(pred_yikes) +
#  geom_tile(aes(x=PecHz, y=CaudHz, fill=VO2minBac)) +
#  geom_point(aes(x=PecHz, y=CaudHz), data=hz) +
#  theme_minimal() +
#  scale_fill_viridis() +
#  coord_equal() +
#  facet_wrap(~cond)
#
#print(p)
#
#
#
