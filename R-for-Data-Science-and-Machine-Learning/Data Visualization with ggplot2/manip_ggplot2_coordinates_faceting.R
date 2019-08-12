library(ggplot2)
pl <- ggplot(mpg,aes(x=displ,y=hwy)) + geom_point()

pl2 <- pl + coord_cartesian(xlim = c(1,4),ylim = c(15,30))

# to change the aspect ratio of the plot (by default it's (1,1))
pl3 <- pl + coord_fixed(ratio = 1/3)
# What you want to facet by on the Y axis (dot is "everything")
# and what you want to facet by on X axis (cyl)
pl4 <- pl + facet_grid(. ~ cyl)
pl5 <- pl + facet_grid(drv ~ .)
pl6 <- pl + facet_grid(drv ~ cyl)

print(pl6)