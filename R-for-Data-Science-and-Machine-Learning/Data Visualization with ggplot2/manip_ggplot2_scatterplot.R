library(ggplot2)
df <- mtcars

# DATA & AESTHETICS
pl <- ggplot(df,aes(x=wt,y=mpg))

# GEOMETRY
# print(pl + geom_point(size=5,alpha=0.5))
# print(pl + geom_point(aes(size=hp)))  # continuous values

# discrete values, so should be factor values
# print(pl + geom_point(aes(size=factor(cyl), alpha = 0.4)))

# Or, shape (since 'size' is not advosed with categorical variables)
#print(pl + geom_point(size = 5, aes(shape=factor(cyl), alpha = 0.4)))
      
# now with color:
#print(pl + geom_point(size = 4, aes(shape=factor(cyl), color=factor(cyl)),alpha=0.9))

# COLOR
#print(pl + geom_point(size=5,color='#77c410'))

pl2 <- pl + geom_point(aes(color=hp),size=5)

pl3 <- pl2 + scale_color_gradient(low='#77c410',high='#FF0055')

print(pl3)