# some fish analysis

# David Lawrence Miller 4 December 2017

## 1. datastuff

# load some data, from JvdH, 4/11/2017
library(readxl)
fish <- read_xlsx("FHL_FishVO2_allreps.xlsx")

# make the things that need to be factors factors
fish$Fish <- as.factor(fish$Fish)
fish$Flow <- as.factor(fish$Flow)
fish$Rep <- as.factor(fish$Rep)
# make a speed^2 variable for convenience
fish$Speed2 <- fish$Speed^2



## 2. let's fit some simple models...

library(nlme)
# comparing using speed and speed^2
mod <- lme(VO2minBac ~ Flow:Speed, list(Fish=~1), data=fish)
mod2 <- lme(VO2minBac ~ Flow:Speed2, list(Fish=~1), data=fish)

# comparing observed and predicted values...
# looks like there is some non-linearity when speed is used
plot(fish$VO2minBac, predict(mod))
# much better with speed^2!
plot(fish$VO2minBac, predict(mod2))

# okay but this wasn't in the list of models that we wanted to check
# instead want to fit something of the form
#  O2 ~ a + b*Speed^c
# estimate a,b,c and have a random effect for fish
# each a,b,c has two levels, one for each treatment (Laminar/Turbulent)

# NOTES:
# - formula is NOT a standard R formula
# - fixed specifies the form for the fixed effects (the a,b,c parameters)
# - random says what the random effects are (random intercept for a)
# - starting values are from previous magic
modr <- nlme(VO2minBac~a+b*Speed^c,
             fixed = a+b+c~Flow,
             random = a+b+c~1|Fish,
             start=c(168.7038472,0, 6,0, 2.2036793, 0),
#correlation=corCAR1(form=~Speed|Fish),
# ^^^ maybe want to think about this later?
             data=fish)

# does this seem right?
summary(modr)

# plot observed vs predicted
plot(fish$VO2minBac, predict(modr),
     asp=1,
     xlab="Observed VO2minBac", ylab="Predicted VO2minBac")
abline(a=0,b=1, col="blue", lty=2)
# same but average over repetitions...
# (a bit cleaner)
plot(aggregate(fish$VO2minBac, list(fish$Speed, fish$Flow, fish$Fish), mean)$x,
     aggregate(predict(modr), list(fish$Speed, fish$Flow, fish$Fish), mean)$x,
     asp=1,
     xlab="Observed VO2minBac", ylab="Predicted VO2minBac")
abline(a=0,b=1, col="blue", lty=2)





## 3. model checking...

# per fish residuals
# - this looks okay, no major variations
bp_dat <- data.frame(resids = residuals(modr),
                     Fish   = fish2$Fish)
boxplot(resids~Fish, bp_dat)

# residuals by Speed
# - these look okay too, maybe some increase in variance at higher speeds?
dat <- data.frame(residuals = residuals(modr),
#                  Speed     = cut(fish$Speed, seq(0.25,4.75,0.5)))
                  Speed     = cut(fish$Speed, c(seq(0.25,3.75,0.5), 4.75)))
boxplot(residuals~Speed, dat, varwidth=TRUE)

# predictions vs. residuals
# - hmm, looks like we do a bad job for very large O2 values?
plot(modr)

# what aout a q-q plot of the residuals
# - not perfect: looks like we aren't doing such a good job in the tails?
qqnorm(modr, abline=c(0,1))

# q-q of the random effects (we think they should be normal)
qqnorm(modr, ~ranef(.))





## 4. prediction plots
library(ggplot2)

# plot predictions per Fish
# make prediction grid, then predict
preddat <- expand.grid(Speed = seq(0.5, 4.5, by=0.1),
                       Flow  = c("L", "T"),
                       Fish  = unique(fish$Fish))
plotty <- predict(modr, preddat, level=1)
plotty <- cbind(preddat, VO2minBac=plotty)

p <- ggplot(plotty, aes(x=Speed, y=VO2minBac, group=Flow, colour=Flow)) +
  geom_line(size=0.75, linetype=2) +
  geom_point(data=fish) +
  facet_wrap(~Fish, nrow=2) +
  theme_minimal() +
  scale_colour_brewer(type="qual")
print(p)



# plot predictions averaged over Fish
# make prediction grid, then predict
preddat <- expand.grid(Speed = seq(0.5, 4.5, by=0.1),
                       Flow  =  c("L", "T"))
plotty <- predict(modr, preddat, level=0)
plotty <- cbind(preddat, VO2minBac=plotty)

p <- ggplot(plotty, aes(x=Speed, y=VO2minBac, group=Flow, colour=Flow)) +
  geom_line(size=0.75, linetype=2) +
  geom_point(data=fish) +
  theme_minimal() +
  scale_colour_brewer(type="qual")
print(p)







# if we wanted to be really fancy we might do this...
#library(mgcv)
#modgam <- gam(VO2minBac ~ s(Speed, Flow, bs="fs") +s(Fish, bs="re"), data=fish)


