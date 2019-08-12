library(ggplot2)
library(plotly)

pl <- ggplot(mtcars,aes(mpg,wt)) + geom_point()

# mae it interactive
gpl <- ggplotly(pl)
print(gpl)