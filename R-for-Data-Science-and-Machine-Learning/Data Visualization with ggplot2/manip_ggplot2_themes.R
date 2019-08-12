library(ggplot2)
library(ggthemes)
# This will add a theme for all plots
#theme_set(theme_minimal())

pl <- ggplot(mtcars,aes(x=wt,y=mpg)) + geom_point()

#print(pl + theme_dark())
print(pl + theme_wsj())