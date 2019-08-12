library(ggplot2)
library(ggthemes)
df <- txhousing

#pl <- ggplot(data=mpg,aes(x=manufacturer)) 

#pl <- pl + geom_bar(aes(fill=factor(cyl)))

pl <- ggplot(data=df, aes(x=sales,y=volume))
pl <- pl + geom_point(color='blue',alpha=0.5)
pl <- pl + geom_smooth(color='red')
print(pl)