# 1, Creaiting Data Frame
empty <- data.frame()
c1 <- 1:10
print(c1)
c2 <- letters[1:10]
print(c2)
df <- data.frame(col.name.1=c1,col.name.2=c2)
print(df)

# 2. Importing and Exporting Data

# Output to csv
write.csv(df, file='saved_df.csv')  # saves the index, as well

d2 <- read.csv('saved_df.csv')  # here that index is read
print(d2)
# For Excel Files
# Load the readxl package
#library(readxl)
# Call info from the sheets using read.excel
#df <- read_excel('Sample-Sales-Data.xlsx',sheet='Sheet1')

# 3. Getting Information about Data Frame
# row/col counts
print(nrow(df))
print(ncol(df))
print(colnames(df))
print(str(df))
print(summary(df))

# 4. Referencing Cells

vec <- df[[5,2]]
print(vec)

newdf <- df[1:5, 1:2]
print(newdf)

newdf <- df[1:5, 'col.name.2']
print(newdf)

# assign a value to a single cell
df[[2, 'col.name.1']] <- 99999
print(df)

# 5. Referencing Rows
rowdf <- df[1, ]
print(rowdf)

# to get a row as a vector, use following
vrow <- as.numeric(as.vector(df[1,]))
print(vrow)

# 6. Referencing Columns

