library(ggplot2)
library(ggplot2movies)

# DATA & AESTHETICS
pl <- ggplot(movies,aes(x=year, y=rating))
pl1 <- pl + geom_bin2d()
pl2 <- pl + geom_bin2d(binwidth=c(3,1)) + scale_fill_gradient(low='red',high='yellow')

#install.packages('hexbin')
pl3 <- pl + geom_hex() + scale_fill_gradient(low='#391E39',high='#FAFFAB')

pl4 <- pl + geom_density2d()
print(pl3)