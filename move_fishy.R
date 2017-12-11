# look at the movement data

# David Lawrence Miller 7 December 2017

library(R.matlab)

# data saved by Julie van der Hoop from MATLAB
move <- readMat("FHL_centroiddata_Dec2017.mat")

# data description from JvdH
#
# fish, condition, speed are the values for the 48 trials: low, medium high speed at L and T.
# H_ = high speed, M_ = medium speed, L_ = low speed
# x, y, z dimensions
# L, T conditions
#
# 4320 = all in one vector (M_zT = 4320 x 1, all of the values vertically concatenated)
# 540 x 8 = separated by 8 individuals (one column per fish). 540 positions of the snout of each animal (M_zT_r) — r is for “reshaped”
#
# Focused Approach: mn_cx, mn_cy, mn_cz = mean centroids calculated from those snout positions


# quick viz
#library(rgl)
#with(move, plot3d(H.xL.r[,1], H.yL.r[,1], H.zL.r[,1], type="l"))

summary_pos <- with(move, data.frame(Fish   = unlist(fish),
                                     cond   = c(rep("L", 24), rep("T", 24)),
                                     speed  = rep(rep(c("H", "M", "L"), 8), 2),
                                     mean_x = c(apply(H.xL.r, 2, sd),
                                                apply(M.xL.r, 2, mean),
                                                apply(L.xL.r, 2, mean),
                                                apply(H.xT.r, 2, mean),
                                                apply(M.xT.r, 2, mean),
                                                apply(L.xT.r, 2, mean)),
                                     mean_y = c(apply(H.yL.r, 2, sd),
                                                apply(M.yL.r, 2, mean),
                                                apply(L.yL.r, 2, mean),
                                                apply(H.yT.r, 2, mean),
                                                apply(M.yT.r, 2, mean),
                                                apply(L.yT.r, 2, mean)),
                                     mean_z = c(apply(H.zL.r, 2, sd),
                                                apply(M.zL.r, 2, mean),
                                                apply(L.zL.r, 2, mean),
                                                apply(H.zT.r, 2, mean),
                                                apply(M.zT.r, 2, mean),
                                                apply(L.zT.r, 2, mean))))


library(ggplot2)
p <- ggplot(summary_pos) +
  geom_point(aes(x=mean_x, y=mean_z, colour=speed, shape=cond)) +
  facet_wrap(~speed) +
  theme_minimal()
print(p)


library(reshape2)
summary_pos_melt <- melt(summary_pos, id=c("Fish", "cond", "speed"))

summary_pos_melt$speed <- factor(summary_pos_melt$speed,
                                 levels(summary_pos_melt$speed)[c(2,3,1)])

p <- ggplot(summary_pos_melt, aes(x=speed, y=value, colour=cond, shape=cond)) +
  geom_point() +
  geom_smooth(aes(group=cond), method="lm") +
  facet_wrap(~variable) +
  theme_minimal()
print(p)



# okay, let's do this repeated measures thingo

pos <- with(move, data.frame(fish   = rep(rep(unlist(fish)[1:8], rep(540, 8)), 6),
                             cond   = rep(c("L", "T"), rep(nrow(H.xL)*3, 2)),
                             speed  = rep(rep(c("H", "M", "L"), rep(540*8, 3)), 2),
                             x      = c(H.xL,
                                        M.xL,
                                        L.xL,
                                        H.xT,
                                        M.xT,
                                        L.xT),
                             y      = c(H.yL,
                                        M.yL,
                                        L.yL,
                                        H.yT,
                                        M.yT,
                                        L.yT),
                             z      = c(H.zL,
                                        M.zL,
                                        L.zL,
                                        H.zT,
                                        M.zT,
                                        L.zT)))

#p <- ggplot(pos) +
#  geom_line(aes(x=x, y=z, colour=fish)) +
#  facet_grid(cond~speed) +
#  theme_minimal()
#print(p)

#library(MCMCglmm)
#b <- MCMCglmm(cbind(x, y ,z) ~ trait:cond + trait:speed -1, family=rep("gaussian", 3),
#              random=~fish, rcov = ~ us(trait):units, data=pos)


#library(mgcv)
#b <- gam(list(x~speed:cond, y~speed:cond, z~speed:cond, 1+2+3~s(fish, bs="re")),
#         data=pos, family=mvn(3), method="REML")









