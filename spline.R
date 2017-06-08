

library(dplyr)
library(ggplot2)

x=seq(1,23)
y=c(	0,	0,	0,	0,	0,	1329,	2579,	3246,	7658,	10000,	13245,	17598,	20000,	17893,	16783,	23879,	30000,	23478,	15678,	10000,	5673,	46,	32)

inter_pt=3
tot_pt=inter_pt*22+23

z=spline(x = x,y = y,n = tot_pt,method = "fmm")$y

dat=data.frame(x=seq(1,23,1/(1+inter_pt)),
               z=z)

p=ggplot(data = dat) +
  geom_area(aes(x = x,y = z))

p

