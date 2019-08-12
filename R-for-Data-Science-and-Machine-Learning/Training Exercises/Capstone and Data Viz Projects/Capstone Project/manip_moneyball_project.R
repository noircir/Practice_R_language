library(data.table)
batting <- fread('Batting.csv')
print(head(batting))
print(str(batting))
print(head(batting$AB))
# Using fread, we can reference a column that starts with a number
print(head(batting[,'2B']))
# Adding a new column of batting average BA
batting$BA <- batting$H / batting$AB
print(head(batting[,'BA']))
print(tail(batting[,'BA']))
print(tail(batting$BA,5))