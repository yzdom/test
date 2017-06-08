

library(dplyr)
library(ggplot2)

set.seed(100)

x=seq(1,23)
y1=c(	0,	0,	0,	0,	0,	1329,	2579,	3246,	7658,	10000,	13245,	17598,	20000,	17893,	16783,	23879,	30000,	23478,	15678,	10000,	5673,	46,	32)
y2=y1+c(rep(0,5),rnorm(23-5,0,5000))

inter_pt=3
tot_pt=inter_pt*22+23

z1=spline(x = x,y = y1,n = tot_pt,method = "fmm")$y
z2=spline(x = x,y = y2,n = tot_pt,method = "fmm")$y

dat=data.frame(x=rep(seq(1,23,1/(1+inter_pt)),
                     2),
               z=c(z1,z2),
               des=c(rep('current',tot_pt),
                     rep('proposed',tot_pt))
               )

p=ggplot(data = dat) +
  geom_area(aes(x = x,y = z,fill=des,alpha=0.2),
            position = 'dodge')

p

