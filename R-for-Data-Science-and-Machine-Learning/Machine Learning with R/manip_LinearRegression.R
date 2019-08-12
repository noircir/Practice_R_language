# Read CSV, note the delimiter (sep)
df <- read.csv('student-mat.csv',sep=';')
#print(summary(df))
#print(any(is.na(df)))  # FALSE

#print(str(df))  # categorical features are listed as "Factors"
# Medu, Fedu, traveltime, studytime are more categorical... Convert them to factors?

#===========================
# Exploratory Data Analysis
#===========================
library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)

# Take only numeric columns. Apply logical is.numeric first
numeric.cols <- sapply(df,is.numeric) # FALSE, FALSE, TRUE,...

# Now correlation matrix ('cor' math function in cheat-sheet)
#correlated.data <- cor(df[,numeric.cols],)
#print(correlated.data)

#print(corrplot(correlated.data,method='pie'))
#print(corrplot.mixed(correlated.data,lower.col = "black", number.cex = .7))

# With corrgram we can pass data frame directly 
# (not cleaning out the numeric columns first)
#print(corrgram(df))
#print(corrgram(df,order=TRUE, lower.panel=panel.shade,upper.panel=panel.pie, text.panel=panel.txt))

# Since we're going to eventually try to predict the G3 score 
# let's see a histogram of these scores:
#pl <- ggplot(df,aes(x=G3)) + 
#  geom_histogram(bins=20,alpha=0.5,fill='blue') + 
#  theme_minimal()
#print(pl)


#===========================
# Building a model
#===========================
library(caTools)
set.seed(101)

# Split up the sample, basically randomly assigns a booleans to a new column "sample"
sample <- sample.split(df$G3, SplitRatio = 0.70) # SplitRatio = percent of sample==TRUE

# Training Data
train = subset(df, sample == TRUE)
# Testing Data
test = subset(df, sample == FALSE)

#===========================
# Training the model
#===========================
# model <- lm(y ~ x1 + x2,train) # using two features
model <- lm(G3 ~ .,train)  # usilg all features
print(summary(model))


#===========================
# Visualize the model
#===========================
#We can visualize our linear regression model by plotting out the residuals, 
# the residuals are basically a measure of how off we are for each point in the plot 
# versus our model (the error).
# Grab residuals
res <- residuals(model)
print(class(res)) # numeric

# Convert to DataFrame for gglpot
res <- as.data.frame(res)
print(head(res))

# Histogram of residuals
pl <- ggplot(res,aes(res)) +  geom_histogram(fill='blue',alpha=0.5)
#print(pl)

# Four plots
#plot(model)

#===========================
# Make predictions
#===========================

G3.predictions <- predict(model,test)

results <- cbind(G3.predictions,test$G3) 
colnames(results) <- c('pred','real')
results <- as.data.frame(results)
print(results)

# Taking care of negative predictions
to_zero <- function(x){
  if  (x < 0){
    return(0)
  }else{
    return(x)
  }
}

results$pred <- sapply(results$pred,to_zero)
print(results)

# Evaluation of predicted values: for example, MSE:
mse <- mean((results$real-results$pred)^2)
print(mse)

# RMSE
rmse <- mse^0.5
print(rmse)

# Or just the R-Squared Value for our model (just for the predictions)
SSE = sum((results$pred - results$real)^2)
SST = sum( (mean(df$G3) - results$real)^2)

R2 = 1 - SSE/SST
print(R2)  # 0.8 => the model explains 80% of the results (not bad)





