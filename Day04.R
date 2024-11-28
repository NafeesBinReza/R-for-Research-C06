# Conditional Logic 

# if..else statement syntax (2 conditions)
if (condition){
  # do something 
} else {
  # do something 
}

num <- -10
if (num > 0) {
  print("Positive")
} else {
  print("Negative")
}

# if...else if...else statement (more 2 conditions)
if(condition1) {
  # do something 
} else if(conditon2) {
  # do something 
} else if(condition3) {
  # do something 
} else {
  # do something 
}

bmi <- 26
if(bmi < 18.5){
  print("underweight")
} else if(bmi >= 18.5 && bmi < 25){
  print("normal")
} else if(bmi <= 25 && bmi < 30){
  print("overweight")
} else{
  print("obese")
}

# ifelse() function - 2 conditions 
ifelse(condition, "do something", "do something")

num2 <- 11
ifelse(num2%%2 == 0, "even", "odd")

ages <- c(22, 12, 23, 21, 28, 11, 10, 9)
ifelse(ages < 18, "child", "adult")

# Loops / Iteration 
print("Bangladesh")
print("Bangladesh")
print("Bangladesh")
print("Bangladesh")
print("Bangladesh")

# for loop 
for(variable in sequence) {
  # do something 
}

for(i in 1:5){
  print("Bangladesh")
}

# increment 
for(i in 1:10){
  print(i)
}

# decrement 
for(i in 10:1){
  print(i)
}

# use condition inside for loop 
for(i in 1:20){
  if(i%%2 == 0){
    print(i)
  }
}

# break statement 
for(a in 1:50){
  if(a == 20){
    break
  }
  print(a)
}

# next statement 
for(a in 1:50){
  if(a == 20){
    next
  }
  print(a)
}

# while loops 
counter = 0
while(condition){
  # do something 
}

# print 1-10
num <- 1
while(num <= 10){
  print(num)
  num <- num + 1
}

num <- 10
while(num > 0){
  print(num)
  num <- num - 1
}



# Data Manipulation with R: The tidyverse ecosystem 
install.packages("tidyverse")
install.packages("gapminder")

# load packages 
library(tidyverse)
library(gapminder)
data <- gapminder

# Exploring data 
# 1. examine first few rows 
head(data)
head(data, 10)
head(data, n = 20)

# 2. examine last few rows 
tail(data)
tail(data, 10)
tail(data, n = 20)

# 3. check dimension 
dim(data)
ncol(data)
nrow(data)

# 4. check columns names 
names(data)

# 5. check data structure 
str(data)
glimpse(data)

# 6. sample 
sample(data)
sample_n(data, 20)
sampled_data <- sample_frac(data, 0.20)

# Data Manipulation with dplyr 
# Common structure of dplyr function/verb 
function_name(data, your_desire)

# Subset Column: select() 
select(data, col_name)

# 1. select single column by column number 
select(data, 1)

# 2. select multiple columns by column number 
select(data, 1, 3)

# 3. select multiple columns by a range 
select(data, 1:3)

# 4. select multiple columns by c() function 
select(data, c(1, 3, 5))

# 5. select single column by column name 
select(data, country)

# 6. select multiple columns by column name 
select(data, country, pop)

# 7. select column by contains() function
select(data, contains("c"))
select(data, contains("c"), contains("g"))

# 8. select column by starts_with() function 
select(data, starts_with("c")) 

# 9. select column by ends_with() function
select(data, ends_with("t"))

# Removing columns 

# 1. remove single column by column number 
select(data, -1)

# 2. remove multiple columns by column number 
select(data, -1, -3)
select(data, -c(1,3))

# 3. remove multiple columns by a range 
select(data, -1:3)

# 4. remove multiple columns by c() function 
select(data, -c(1, 3, 5))

# 5. remove single column by column name 
select(data, -country)

# 6. remove multiple columns by column name 
select(data, -country, -pop)
select(data, -c(country, pop))


# Subset Rows: filter()
filter(data, conditon)

# equality (==)
filter(data, country == "Bangladesh")

# inequality (!=)
filter(data, country != "India")

# greater (>)
filter(data, gdpPercap > 800)

# less (<)
filter(data, gdpPercap < 800)

# greater or equal (>=)
filter(data, gdpPercap >= 800)

# less or equal 
filter(data, gdpPercap <= 800)

# LOGICAL AND 
filter(data, country == "Bangladesh" & gdpPercap > 800)

# LOGICAL OR 
filter(data, country == "Bangladesh" | gdpPercap > 800)

# multiple filtering criteria 
filter(data, country == "Bangladesh" | country == "China" | country == "India")

filter(data, country == c("Bangladesh", "China", "India"))

# %in% operator 
filter(data, country %in% c("Bangladesh", "China", "India"))

# Select: country, continent, pop, gdpPercap
filtered_data <- select(data, country, continent, pop, gdpPercap)

# filter: gdpPercap > 800
filter(filtered_data, gdpPercap > 800)

# Pipe Operator / Chaining Methods (CLT+SHIFT+M)
data |> 
  select(country, continent, pop, gdpPercap) |> 
  filter(gdpPercap > 800)

# Creating new column: mutate()
data |> 
  mutate(gpd = gdpPercap * pop / 10^6)

# Renaming column: rename() 
data <- data |> 
  rename(population = pop)

# Grouping data ~ categorical (groups) ~ numeric (summary)
data |> 
  group_by(continent) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeExp = sd(lifeExp))

# Sorting data ~ by numeric variable 
data |> 
  group_by(continent) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeExp = sd(lifeExp)) |> 
  arrange(mean_lifeExp)

# desc
data |> 
  group_by(continent) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeExp = sd(lifeExp)) |> 
  arrange(desc(mean_lifeExp)) 

# top 
data |> 
  group_by(country) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeExp = sd(lifeExp)) |> 
  arrange(desc(mean_lifeExp)) |> 
  head(20)

# down 
data |> 
  group_by(country) |> 
  summarise(mean_lifeExp = mean(lifeExp), 
            sd_lifeExp = sd(lifeExp)) |> 
  arrange(desc(mean_lifeExp)) |> 
  tail(20)

# Categorization 
max(data$lifeExp)
min(data$lifeExp)

# 2 conditions 
data |> 
  mutate(lifeExpStatus = ifelse(lifeExp > 50, "Good", "Poor"))

# more than 2 conditions (Poor, Moderate, Good)
data |> 
  mutate(lifeExpStatus = case_when(
    lifeExp < 50 ~ "Poor", 
    lifeExp >= 60 ~ "Moderate", 
    lifeExp > 70 ~ "Good"
))