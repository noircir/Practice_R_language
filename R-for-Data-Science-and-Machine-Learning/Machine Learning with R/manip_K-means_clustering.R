library(datasets)
print(head(iris))

# EDA

library(ggplot2)
pl <- ggplot(iris, aes(Petal.Length, Petal.Width, color = Species))
pl <- pl + geom_point()
#print(pl)

#print(hist(iris$Sepal.Length))
#print(plot(density(iris$Sepal.Length)))
#print(pairs(iris))

# Clustering

set.seed(101)

irisCluster <- kmeans(iris[, 1:4], 3, nstart = 20)
print(irisCluster)

# Evaluation of results

print(table(irisCluster$cluster, iris$Species))

library(cluster)
print(clusplot(iris, irisCluster$cluster, color=TRUE, shade=TRUE, labels=0,lines=0, ))