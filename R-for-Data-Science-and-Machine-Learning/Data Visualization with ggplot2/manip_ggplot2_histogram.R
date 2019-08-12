library(ggplot2)
library(ggplot2movies)

# DATA & AESTHETICS
pl <- ggplot(movies,aes(x=rating))

# GEOMETRY
# pl2 = pl + geom_histogram(binwidth=0.2,color='red',fill='pink',alpha='0.4')

pl2 = pl + geom_histogram(binwidth=0.2,aes(fill=..count..))
pl3 = pl2 + xlab('Movie Rating') + ylab('Count') + ggtitle('My Histogram')
print(pl3)