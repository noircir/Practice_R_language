# this is a comment
goog <- c(450,451,452,445,468)
msft <- c(230,231,232,233,220)

stocks <- c(goog,msft)

stock.matrix <- matrix(stocks,byrow = T,nrow = 2)

days <- c('Mon','Tue','Wed','Thu','Fri')
st.names <- c('GOOG','MSFT')

colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names

print("====================")
print("Stocks at the start")
print("====================")
print(stock.matrix)

# create a vector
FB <- c(111,112,113,120,145)

# create a new matrix by adding this new vector 
# as a row (rbind) to the old matrix (the row name 
# appears automatically)
tech.stocks <- rbind(stock.matrix,FB)
print("====================")
print("Add FB")
print("====================")
print(tech.stocks)

avg <- rowMeans(tech.stocks)
# print(avg)

# now add a column (cbind) of this average
tech.stocks <- cbind(tech.stocks,avg)
print("====================")
print("Add average of each stock")
print("====================")
print(tech.stocks)




