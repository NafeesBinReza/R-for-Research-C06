# collection of things/items: vector 
# 1. Creating a vector using c() function 
even_num <- c(2, 4, 6, 8)
colors <- c("black", "yellow", "green")
logical_vector <- c(TRUE, FALSE, TRUE)
mixed_vector <- c(22, TRUE, "black")

# number of elements/items 
length(even_num)

class(even_num)
class(colors)
class(logical_vector)
class(mixed_vector)

# 2. Creating vector using : operator (sequence)
seq_vector <- 1:20
seq_vector

# 3. Creating a vector using seq() function 
seq(1, 20)
# seq(start = 1, stop = 20, by = 2)
seq(1, 20, 2)


# sub-set  
ages <- c(22, 12, 24, 52, 33, 23, 27, 29)

# subset a single element using the position of elements 
ages[3]

# subset multiple elements (specific)
ages[c(3, 5, 7)]

# subset multiple elements (range)
ages[1:4]

# conditional subset 
ages[ages > 20]
ages[ages < 18]

# Factor 
smoking <- c("yes", "no", "no", 'yes', "no")
smoking_status <- factor(c("yes", "no", "no", 'yes', "no"))


class(smoking)
summary(smoking)
summary(smoking_status)

# matrix 
matrix(1:9)
matrix(1:9, nrow = 3)
matrix(1:9, nrow = 3, ncol = 3)
mat <- matrix(1:9, nrow = 3, ncol = 3, byrow = T)

# matrix properties 
dim(mat)
ncol(mat)
nrow(mat)
colnames(mat)
rownames(mat)

c("X", "Y", "Z") 
c("A", "B", "C")

mat_new <- matrix(1:9, nrow = 3, ncol = 3, 
  dimnames = list(
  c("X", "Y", "Z"),
  c("A", "B", "C")
))

colnames(mat_new)
rownames(mat_new)

# tabular data / data frame 
data <- data.frame(
  age = c(10, 11, 15, 16, 17, 18, 19), 
  geneder = c("male","female", "male", "female", "female", "female", "male"), 
  smoking = c("no", "yes", "no", "no", "yes", "no", "yes")
)

# exploring data 
# check dimension 
dim(data)
ncol(data)
nrow(data)

# 1. examine first few rows 
head(data)
head(data, n = 10)

# 2. examine last few rows
tail(data)
tail(data, n = 10)

# 3. examine data structure 
str(data)

# 4. access specific column 
data$age

# 4. convert data type (as family)
data$geneder <- as.factor(data$geneder)
data$smoking <- as.factor(data$smoking)

# 5. run summary stats 
summary(data)

# exploring built-in data 
data()
BOD                  
CO2
airquality

head(airquality)
str(airquality)

# 1. Vector - c(), :, seq() 
# 2. Factor 
# 3. Matrix 
# 4. List 
# 5. Data Frame 

# 1. Quantitative (Numeric)
# 2. Categorical (Factor)






