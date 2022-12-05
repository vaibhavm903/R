w <- 24
y <- "S"
h <- w**3
ls()
d <- c(3,5,6,7)
class(d)
length(d)

#Vectorization
d+3
d*2
#You can only do numerical operations directly with vectors not list
#This is because vectors can contain only one type of data


#Class is character even if 1 character is introduced
s <- c(36.4,3.57,"df")
class(s)


#Class is numeric
s <- c(36.4,3.57)
class(s)

#rm(variable_name) to remove a variable from the environment
a=10
rm(a)

name <- c("A","H","L","M")
age <- c(34,78,12,55)

#Horizontal Binding
rb <- rbind(name,age)
rb

#Vertical Binding

cb <- cbind(name,age)
cb

#Measurable quatities are maintained in columns...
#For example if in an experiment we are maintaining temp,pressire,resistance,
#then we should store them in colums i.e they should be in 10X3 format (RxC)

class(rb)


#Dataframes

df <- data.frame(name,age)
df
View(df)


#Matrices are for mathematical calculations
#Dataframes are for data management -> pulling and working with data
#Collection of different vectors of same size binded together


#Inbuilt dataframes -> These dataframes have been created for practice purposes

data(mtcars)
View(mtcars)


#To access a certain column of a Dataframe like disp[Displacement] from mtcars
#dataset we can use $... "." is not any sort of specifier its the same as "_"
new <- mtcars$disp
mean (new)  #Function to calculate mean
sd(new)     #Function to calculate Standard Deviation

summary(new) # Displays Min. 1st Qu. Median  Mean 3rd Qu. Max. for the data


#List
#Lists can contain objects of different types
#Many times the outputs of arithmatic functions are expressed as Lists
#Lists can be created using functions

s <- list(a=6,g=9.43,h="ftr",k=c(4,2,1,5))
class(s)
#Ways to access elements in the list
#Access using names
s$g

s$k

s$k[4]
#Access using position, list strts from index 1
s[2] #Shows the name and the value of the named element

s[[2]] #Directly shows the value of the element
#For accessing vector within list
s[[4]][2]


#Factors are like String -> They are used to represent categorical data
#Non numeric non primary


gdr <- c("F","M","M","F")
df1$gdr
df1 <- data.frame(name,age,gdr)
df1$gdr <- factor(df1$gdr) #Converting vector to factor, adds an attribute called
#Levels that contains the unique values in the vector, sorted in ASCII order
df1$gdr

as.integer(df1$gdr) #Maps an integer to the unique values of factor vector i.e., levels
#in the same order as Levels is sorted so in case of gdr it mapped F -> 1 and M -> 2

#Now we specify the Levels order in the factor function so the mapping gets changed to
#M->1 and F->2
df1$gdr <- factor(df1$gdr,levels=c("M","F"))
as.integer(df1$gdr)


#Missing values are represented as NA or NAN
# NA --> Not Available i.e, no number is present
# NAN --> Not a Number i.e, Not defined or indeterminate like 0/0 in maths
f<-NA

#is.na(value) to check if a value is NA(or NaN) or not as T or F

is.na(f)

#This will check which values in the vector is NA(or NaN) as TRUE or FALSE
d <- c(NA,1,4,NA,NA,5, NaN)
is.na(d)

#table function gives you frequency table

table(is.na(d))

#OR

sum(is.na(d)) #Gives you how many numbers are there a.k.a counts the number of TRUE val 

#OR

as.integer(is.na(d)) #Maps TRUE to 1 and FALSE to 0

#Checks if value in f is NaN
f1 <- NaN
is.nan(f1)
#Checks if all values of vector are NaN
is.nan(d)

#Check if value is finite
f2 <- 23/0
is.finite(f2)
#Check if value is infinite
is.infinite


#Matrix can hold data in matrix form, can be created with R functions

m <- matrix(c(9,3,1,5,6,3),3,2) #Column wise
m

m <- matrix(c(9,3,1,5,6,3),3,2,byrow=T) #Row wise
m

#if correct size is con provided in the dimensions the values are recycled
m <- matrix(c(9,3,1,5,6,3),3,3) #Column wise
m

#When 2 vectors are joined where one vector is shorter than the other then
#the shorter one is recycled
name <- c("A","H","L","M","N","F")
age <- c(34,78,12,55)
rb <- rbind(name,age)
rb
#or cut off 
m <- matrix(c(9,3,1,5,6,3),2,2) #Column wise
m

#Array - Used sparingly as matrix does the job of 2 dim and vectors as 1 dim
#Mostly used for process more than 2 dim data

a <- array(dim=c(3,2))
a
#To put values in array

a[1,1] <- 4.56
a[1,2] <- 9
a[3,2] <- 5
a

#Extracting colnames from the data
data("mtcars")
colnames(mtcars)

#For list we use name functions, colnames wont work
s <- list(a=6,g=9.43,h="ftr",k=c(4,2,1,5))
names(s)


#Reading CSV(COMMA SEPARATED VALUES) files
#Make sure that the header is there if the header tag in the read function is set to
#TRUE or the first data in the file will be appropriated as header
b2 <- read.csv("E:/R/Datasets/Bollywood_2015_2.csv")
View(b2)

#header set to False
b2 <- read.csv("E:/R/Datasets/Bollywood_2015_2.csv",header = F)
colnames(b2) <- c("Movies","BO","Budget","Verdict")

View(b2) 

b3 <- read.csv("E:/R/Datasets/Bollywood_2015.csv")
View(b3)

#Set working directory for our Datasets so that we dont have to provide full path
setwd("E:/R/Datasets/")

#If data is separated by something other than ','
b4 <- read.csv("Diamonds.csv",sep = ";")

#It is recommended to use read.csv2 function rather than csv
d1 <- read.csv2("Diamonds.csv")
#It is equivalent to 
b4 <- read.csv("Diamonds.csv",sep = ";",dec=",")

#csv2 was created for convenience 
#Both CS and CSv2 are the same function read.table with different parameters
#for the Separator(sep) and the Decimal (dec) operator


#skip=1 means skip first line
#colClasses : If not provided datatype will be assumed
#sep =" " means separator is space
mem <- read.table("members.txt",header=T,colClasses = c("character","character","integer"),skip=1,sep=" ")

mem


d1 <- read.csv2("Diamonds.csv")

#Find out how many rows and col, datatype of colums of dataframe and a glimpse of the data

str(d1)

#stringsAsFactors:

#Convert all the string values while reading into factors
d1 <- read.csv2("Diamonds.csv", stringsAsFactors = T)
str(d1) #Now all character col types have been converted to Factors


#Reading Excel files using XLSX package using XLSX or readxl

install.packages("xlsx")
library(xlsx)
bank <- read.xlsx("bankruptcy.xlsx",3)

#OR

install.packages("readxl")
library(readxl)
bank1 <- read.xlsx("bankruptcy.xlsx",sheet=3)

#Export data/Write data to CSV format
data("ChickWeight")
write.csv(ChickWeight, "E:/R/Day1/ChickWeight.csv")


#do data() and press CTRL + SPACE (if req) to check for available datasets




#SUBSETTING THE DATA


x <- c(12,23,52,78,90,10,28,93,95,92,95,79)

#Getting a part of vector
x[1:5]

#Compares every element of x to 50 and prints TRUE or FALSE
x>50
#Compares every element of x to 50 and prints the sum of whichever satisfies x>50
sum(x>50)
#Compares every element of x to 50 and prints elements which satisfies x>50
x[x>50]



m <- matrix(c(1:12),4,3)
#Get the element at 3rd row and 2nd colum
m[3,2]

#Get the 2nd row as a vector
m[2,]

#Get the 3rd column as a vector
m[,3]

#Get the 3rd column as a column
m[,3,drop=F]

#Get the second and 4th row
m[c(2,4),]

#Get all the rows from 2nd to the 4th one
m[2:4,]


#These functions also work for dataframes

d1 <- read.csv2("Diamonds.csv")
#We want column no 4 named clarity
d1$clarity

#OR

d1[,4]

#If we want 4th and 6th column
d1[,c(4,6)]

#If we want 4th and 6th column and first 50 rows
#and store for use later, nothing is stored if <- is not used
d1sub <- d1[1:50,c(4,6)]
d1sub
#If we want to exclude certain column of the dataset, use "-" for exclusion
#"-1" means exclude first one

#Exclude 4th and 6th rows
d1sub <- d1[1:50,-c(4,6)]
d1sub

#Exclude the first 50 rows
d1sub <- d1[-c(1:50),-c(4,6)]
d1sub


##FILTERING THE DATA

#Using Subset function

b3 <- read.csv("Bollywood_2015.csv")
b3

#Subset where Box Office collection >50cr
ss <- subset(b3, BO_Collection > 50)
ss
#Subset where Box Office collection >50cr and Budget>70cr
ss <- subset(b3, BO_Collection > 50 & Budget>70)
ss

#Subset where Box Office collection >50cr and Budget>70cr and we want to display
#only Movie_Name and BO_Collection
ss <- subset(b3, BO_Collection > 50 & Budget>70,select = c(Movie_Name, BO_Collection))
ss




#######Day 1 Excercise
ds <- read.csv("Orders.csv")
ds
#1
ss <- subset(ds, Payment.Terms == "Online" )
ss

#2
data("mtcars")
write.csv(mtcars, "E:/R/Day1/mtcars.csv")

#3
ds <- read.csv2("Diamonds.csv")
ds
ss <- subset(ds, cut == "Premium" )
ss

#4
ds <- read.csv2("Diamonds.csv")
ds

df1 <- data.frame(ds$carat,ds$color,ds$depth,ds$price)
colnames(df1) <- c("Carat","color","depth","price")
df1

#OR
ss <- ds[,c(1,3,5,7)]
ss
#5
d <- mtcars[c(2,18,30,12),]
d


#Extra Question

#By manually taking the name from the file and setting column name
ds <- read.csv("breast-cancer-wisconsin.data",header=F)
ds


colnames(ds) <- c("Sample","Clump Thickness","Uniformity","Uniformity Shape",
                  "Marginal Adhesion","Single Epithelial Cell Size","Bare Nuclei",
                  "Bland Chromatin","Normal Nucleoli","Mitoses","Class")
ds

cols <-  c("Sample","Clump_Thickness","Uniformity","Uniformity_Shape",
           "Marginal_Adhesion","Single_Epithelial_Cell_Size","Bare_Nuclei",
           "Bland_Chromatin","Normal_Nucleoli","Mitoses","Class")
ds
write.csv(ds, "E:/R/Day1/Breast_Cancer.csv")


#Extracting the data from the file using functions and adding the column names


ds <- read.csv("breast-cancer-wisconsin.data",header=F)
ds

ds1 <- read.csv("breast-cancer-wisconsin.names",sep = " ",header=F)
ds1
dc1 <- ds1[108:130,4:5, drop=F][c(19,21),1]
dc2 <- ds1[108:130,4:5, drop=F][c(2,3,4,8,10,12,13,15,17),2]
dc1
colv <- append(dc2,dc1)
colnames(ds) <- colv 
ds

#OR

ds1 <- read.csv("breast-cancer-wisconsin.names",header=F,skip = 105,sep = " ")
ds <- read.csv("breast-cancer-wisconsin.data",header=F)
colnames(ds) <- append(ds1[1:10,5][c(-8)],ds1[c(11,13),4])
ds

#OR

ds <- read.csv("breast-cancer-wisconsin.data",header=F)
ds

ds1 <- read.csv("breast-cancer-wisconsin.names",sep = " ",header=F)
ds1
colnames(ds) <- append(ds1[108:130,4:5, drop=F][c(2,3,4,8,10,12,13,15,17),2],ds1[108:130,4:5, drop=F][c(19,21),1])

ds
#####Excercise Functions
Fahrenheit_to_C <- function(f) {
  c <- (f-32)*(5/9)
  c
}

Fahrenheit_to_C(100)


#2nd

Coef_Var <- function(c1) {
  c <- sd(c1,na.rm=T)/mean(c1,na.rm=T)
  c <- c*100
  c
}

cars93 <- read.csv("Cars93.csv",stringsAsFactors = T)
Coef_Var(cars93$Price)

#3rd
g <- c(9.34,8.24,NA,1.345,0.56,0,NA,7.89)


#This function we wrote is called mean imputation. In data where we have NA values we cannot afford
#to delete the data.. Instead we replace the values with mean if reasonable or median, mode etc
mean_impute <- function(x) {
  
  m <- mean(x,na.rm=T)
  y <- ifelse(is.na(x),m,x)
  y
  
}

mean_impute(g)
mean_impute(survery$Pulse)


##Day 2
cars <- read.csv("Cars93.csv",stringsAsFactors = T)
str(cars)
View(cars)
table(cars$Price.Category, cars$Type)
table(cars$Price.Category, cars$Type, cars$Origin) #with filter, 3 dim cross-tab


sum(cars$Price.Category=="15 to 30")

#Unique shows unique elements in dataframe
unique(cars$Price.Category)

#addmargins adds a sum of every column and row totals to the table output
addmargins(table(cars$Price.Category, cars$Type))


#Proportion tables
a <- c(34,90,21,79)
sum(a)

a/sum(a) #Getting proportions of all elements elem/sum

prop.table(a) #Function to get the proportions

#We can apply the prop.table func to cars to get proportion of cars by price category/total cars
prop.table(table(cars$Price.Category))
prop.table(table(cars$Price.Category))*100 #Percentage


#We can apply the prop.table func to cars to cross table 
# to get proportion of cars by category and price category/total cars


prop.table(table(cars$Price.Category,cars$Type))
prop.table(table(cars$Price.Category,cars$Type))*100 #percentage


#Table has missing values
survery <- read.csv("survey.csv",stringsAsFactors = T)
table(survery$Sex, useNA = "ifany") #Frequency table ignores missing value, so we use useNA tag

#Use useNA = ifany whenever you dont know the data


aff <- ifelse(cars$Price>30,"Expensive","Affordable")
aff

#If we want to bind it to a new column in cars(cars93)
cars$Affordability <- ifelse(cars$Price>30,"Expensive","Affordable")
View(cars)
table(cars$Affordability)

#Use cbind to add affordability to the middle of the dataset
cars1 <- cbind(cars[,1:5],aff,cars[,6:28])
cars1

#only 1 NA value can throw off so we use na.rm to remove
mean(survery$Pulse, na.rm = T)
sd(survery$Pulse, na.rm = T)
median(survery$Pulse,na.rm = T)


#quantile gives quartiles for the data, seq generates a sequence from 2 to 32 with 2 step
a <- seq(2,32,by=2)
quantile(a)

quantile(survery$Pulse, na.rm = T) #na.rm is true so that the func removes na data

#If we want to find specific percentile we can use probs flag
quantile(survery$Pulse, na.rm = T, probs=0.6) #This shows 60th percentile 

#Summary function gives you mean max quartile median and the NA's
summary(survery$Pulse)


#attach will make visible all the components of survey without $
#Dont use since it will cause confusion if we have 2 datasets with similarly named cols
attach(survery)
mean(Pulse, na.rm = T) 

#Use detach to make surveys's components invisible again
detach(survery)
#Writing our own Functions in 2 ways 

#With return
add <- function(a,b,c){
  ans <- a+b+c
  return(ans)
}

add(2,4,5)

#mtrs to km
mts <- 45000


#Now as a function without return
m_to_k <- function(m){
  kms <- m/1000
  kms
}

m_to_k(25000)


#To convert any code into a function select a block of code, then go to Code -> 
#Extract function -> Provide Name and Boom presto you got yourself a nice function

m_km_extracted <- function(mts) {
  kms <- mts/1000
  kms
}

#Impute refer to Day2_Excercise, but returning list
mean_impute <- function(x) {
  
  m <- mean(x,na.rm=T)
  y <- ifelse(is.na(x),m,x)
  list(imputed=y, mean=m)
  
}


mean_impute(survery$Pulse)

#Or taking the result in a var

res <- mean_impute(survery$Pulse)
res$mean     #[Extracting the mean from res]
res$imputed  #[Extracting the imputed from res]



#Managing Dates in R


#######Date Class#######

cdt <- "2022-11-05"
cdt
class(cdt)
dt <- as.Date(cdt)
dt
class(dt)


cdt2 <- "2022-10-31"
dt2 <- as.Date(cdt2)
class(dt2)
#Just like C++ the "-" has been overloaded for Date class so it gives us the time difference
#when two Date Objects are subtracted
dt-dt2 
unclass(dt)
unclass(dt2)

#The serial number is negative since its before 1st Jan 1970
dt3 <- as.Date("1947-08-15")
dt3
unclass(dt3)

#The date serial number starts from 1st Jan 1970 so the serial no for that day is 0,
#Any date after is positive, any before is negative
dt4 <- as.Date("1970-01-01")
dt4
unclass(dt4)

Sys.Date() #Uses something called Leopard Case naming



# Different Naming Conventions
#          Camel Case | Leopard Case | Snake Case
#          --------------------------------------
#           ReadCsv   |  read.csv    |  read_csv
#           SysDate   |  Sys.Date    |  Sys_date               
#

cdt1 <- "12-Jan-2022"
dt1 <- as.Date(cdt1,format="%d-%b-%Y")
dt1 #Internally still stored as yyyy-mm-dd which is industry standard

cdt2 <- "31-March-2022"
dt2 <- as.Date(cdt2,format="%d-%B-%Y")
dt2



cdt5 <- "Monday, 10 October 2022"
dt5 <- as.Date(cdt5,format="%A, %d %B %Y")
dt5


dt5+5 #Gives the date 5 after what is stored is dt5


#There is a function called format which converts date back into character
new <- format(dt5, "%A, %d %B %Y")
new
#strptime to strip time from timestamp

dft <- "20 October 2015 13:30:43"
dfy <- strptime(dft,"%d %B %Y %H:%M:%S")
dfy
class(dfy)


#Seq function can also be used to generate a sequence of dates

seq(from=Sys.Date(), length=10, by='week') #Can be done by week, year , month quarter etc




############Times is R###############


dt1 <- Sys.time()#Current sys time
dt1

#POSIXct
class(dt1)
unclass(dt1)


#Converting to POSIXlt
dt <- as.POSIXlt(dt1)
unclass(dt)
#With POSIXlt we get all the components of DT and TIme


#Package lubridate : better way to handle date and time

install.packages("lubridate")
library(lubridate)


cdt1 <- "12-Jan-2022"
dt1 <- dmy(cdt1)

cdt2 <- "03-31-2022"
dt1 <- mdy(cdt2)

dt <- "20, Feb 2015 13:40:32"
dt_prn <- parse_date_time(dt, "dmy_HMS")
class(dt_prn)
dt_prn

#THese functions also work on vectors
cdt <- c("12-Nov-2022", "15-Jun-2022","29-Sep-2022")

dt <- dmy(cdt)
#Functions to extract relevant number from date
d <-day(dt)
d
month(dt,label = F, abbr = F) #Label for full month, ABBR for small like Jan for January
year(dt)
wday(dt)
wday(dt,label=T) #The label makes the Output give the full name of the day of the week

#1->Sunday, 2->Monday etc

month(dt) <- month(dt)+1 #This increases the month value within all the elements of dt by 1





#################TIDYVERSE###################



#Part of Modern R developed post 2008
#Developed in a different way
#This is because earlier it was used for Maths and Stats and not for large scale computations
#or data analysis or re-emergence of AI

#Tidyverse is a group of R packages, like (ggplot,dplyr,tidyr,tibble etc)

#to install the entire tidyverse do
install.packages("tidyverse")

library(tidyverse)

###########DPLYR(DATA PLYER)#############

#tbl_df more efficient than traditional dataframe, subclass of tbl which is subclass ofdataframe

dd=as_tibble(mtcars)
class(dd)
dd

cars93 <- read.csv("Cars93.csv",stringsAsFactors = T)
str(cars)

#Sorting using Arrange
a <- arrange(cars93, Price) #Arrange will sort the data based on the provided parameter

a <- arrange(cars93,Type, Price) #We can provide a third parameter to sort it within the sorted data
#based on the first parameter



a <- arrange(cars93,Type, desc(Price))


#Selecting columns

sel_cars <- select(cars93, Model, Type, Price) #Select Model, type ,Price from cars
sel_cars <- select(cars93, Model:Max.Price) #Select a range of columns from Model to Max_price

#getting cols with regex, starts and ends with and contains
sel_cars <- select(cars93, starts_with("MPG")) 
sel_cars <- select(cars93, ends_with("Price"))
sel_cars <- select(cars93, contains("in"))

#Subsetting the data using filter : faster than subset

ss_cars <- filter(cars93, Type=="Compact")
ss_cars <- filter(cars93, Type=="Compact" & Price>20) #Intersection: Cars that are compact and Price >20
ss_cars <- filter(cars93, Type=="Compact" | Price>20)#Union: Cars that are compact or Price >20


#Like SQL in operator Manufacturer in Audi or Acura, like |
ss_cars <- filter(cars93, Manufacturer %in% c("Ford","Audi"))

#Rename the columns, assign to original var to overwrite
r_cars <- rename(cars93,Minimum=Min.Price, Maximum=Max.Price)

#Add custom columns but at a time you can do multiple columns using mutate
r_cars <- mutate(cars93, Price_range=Max.Price-Min.Price, Ratio=Weight/Passengers)

##########Summarizing the data##############

summarise(cars93, avg_price=mean(Price, na.rm=T))
summarise(cars93, avg_price=mean(Price, na.rm=T), sd_price=sd(Price, na.rm=T))

#Group by

grp_cars <- group_by(cars93,Type)
summarise(grp_cars, avg_price=mean(Price, na.rm=T), sd_price=sd(Price, na.rm=T))

#Chaining/Pipelining

#Using pipeline operators |> or %>% CTRL+SHIFT+M for operator

cars93 %>% 
  group_by(Type) %>%
  summarise(avg_price=mean(Price, na.rm=T), sd_price=sd(Price, na.rm=T))

ss_cars <- cars93 %>% filter( Type=="Compact" & Price>20) #Previous filter function written with pipelining

ss_cars <- cars93 |> filter( Type=="Compact" & Price>20) #Written with the other operator,
#This operator is present in the core R while the other %>%  is from R studio







#Question1

Orders <- read.csv("Orders.csv",stringsAsFactors = T)

dt1 <- dmy(Orders$Order.Date)

Day <- day(dt1)
Month <- month(dt1)
Year <- year(dt1)

Orders <- cbind(Orders,Day,Month,Year)#Using Cbind to append columns
str(Orders)

#Question2

After1Year <- year(dt1)+1 #Incrementing year by 1 and storing it in a variable

Orders <- cbind(Orders,After1Year)




setwd("E:/R/Datasets/")


##################JOINS######################

#Read the contents of A and B csv into variables and use inner join function to join them on ID no
A <- read.csv("A.csv")
B <- read.csv("B.csv")
library(tidyverse)


inner_join(A,B,by="IdNum")
#Read the contents of Orders and details and then join them on Order.ID
orders <- read.csv("Orders.csv")
details <- read.csv("Ord_Details.csv")

o_details <- inner_join(orders, details, by="Order.ID")

#left_join(),right_join(),full_join()

#Similarly we have full join and left join functions

######################TIDYR######################


#Two operations within : Gathering and spreading



#Gathering : using gather()
#Gather is also known as making the data long
table4a
gather(table4a, '1999','2000', key = "year" , value = "cases")#Data name, 2 columns which need to be stacked instead 
#of side by side and key value

#Better function to use is pivot_longer instead of Gather since the former is still under active
#development

pivot_longer(table4a, c('1999','2000'), names_to = "year", values_to = "cases")

#TO transform data back from long from to normal(Making data wider) we use
table2
spread(table2, key="type", value = "count")

pivot_wider(table2, names_from = "type", values_from = "count")


##Separate data from a column into separate colums, data that is separated by some separator
separate(table3, rate, into = c("cases","population"),convert = T)#into is names of the new 2 
#separated columns, while convert is used to autoconvert the data from(here from chr to int) one
#type to another if necessary automatically
#Any special character is considered as special character, multiple at the same time

#If we want to separate not based on delimiter but position
separate(table3, year, into = c("century","year"),sep=2)

#If we want to separate in 2 positions 
separate(table3, year, into = c("century","cent2","year"),sep=c(2,3))



#If we want to join 2 strings instead of separating them

a <- "Machine"
b <- "Learning"
paste(a,b)
paste0(a,b)#Join without separator


#Unite function to unite two columns
table5

unite(table5, new_col, century, year)

#But this joins with a separator "_", if we dont want such separator
unite(table5, new_col, century, year, sep = "")
#Set separator to "" empty string


#For missing data the ones which we see as NA is called explicitly missing,
#The data might also just be missing completely which is called implicitly missing fata


#Missing Data

stocks <- data.frame(
  year=c(2015,2015,2015,2015,2016,2016,2016),
  qtr=c(1,2,3,4,2,3,4),
  return=c(1.88,0.59,0.35,NA,0.92,0.17,2.66)
)
stocks

#to drop NA values
drop_na(stocks)


#Better way to check for NA values since a huge dataset may have many NA values
#and it might be impossible to manually check them or drop them

complete(stocks, year, qtr) #Points out NA values using year and qtr which defines
#the for the datasetcompleteness

mu <-  mean(stocks$return, na.rm=T)
complete(stocks, year,qtr,fill = list(return=mu))


#if we have data that have missing values but is implied that it is binded to the previous
#available value we use fill function to make it data analysis friendly

#Star Plus          Prog1          12
#   NA              Prog2          01
#   NA              Prog3          02

#Above it is implied that Star Plus has 3 programs Prog1,2,3 at three different times,
#but it is not data analysis friendly, so we use Fill function to fill in the gaps

#Star Plus          Prog1          12
#Star Plus          Prog2          01
#Star Plus          Prog3          02
fill(TVrate,channel)

stocks %>% 
  complete( year,qtr) %>% 
  fill(return) #filling NA with previous available value as default


stocks %>% 
  complete( year,qtr) %>% 
  fill(return, .direction = "up") #filling NA with next available value using .direction

TVrate <- data.frame(channel=c("A",NA,NA,"B",NA,NA,NA),
                     ratings = c(2,3,4,5,6,7,2))


#Pivot longer test exercise
quality <- read.csv("qual\ity.csv")

pivot_longer(quality, -Id, names_to = "New_col", values_to = "New_val")




################Graphical Data Representaion######################

#Bar Plot

cars93 <- read.csv("Cars93.csv")

a <- c(45,20,14)
b <- c(40,20,10)
barplot(a) #Basic, crude bar graph
ab <- rbind(a,b) #Binding a and b as rows in dataframe
barplot(ab)#Plotting A and B crudely

#beside stacks them side by sid
#col will specify the color for the bars
barplot(ab, beside=T, col=c("red","blue"))


table(cars93$Type) %>% barplot() #Making a barplot on the frequency table of Types col in cars93 dataset

table(cars93$Type, cars93$Origin) %>% barplot(,beside=T)#Now bar graph on 2 things

#If we want to provide a title to the main graph
table(cars93$Type, cars93$Origin) %>% barplot(,beside=T,main="Car Types")



#HISTOGRAM


hist(cars93$Price, breaks=10) #Breaks are where the class interval is present
#Class intervals should have equal width
#Class intervals also known as Bins

#Histograms have continuous scale at x axis so we cant shuffle
#Judge breaks correctly, too many breaks can screw up the data


d <- read.csv2("Diamonds.csv")
hist(d$price, breaks=10,main = "Diamond Pricing", col=colors()[45]) #Breaks are where the class interval is present
colors()
#Gives you all the colors in R
#You can specify  colors()[<number>] to get the colors according to the number assigned to the color


####BOX PLOT######
#Also known as Box and Whisker plot which are the two lines above and below the box
#Gap between FIrst and 3rd Quartile is called Inter Quartile Range (IQR)
#In boxplot we only plot quartiles
#Any data point that is 1.5IQR away from the edge of Box Plot it is tagged as Outlier

#Outliers are extreme Observations that need to be tracked, more the variation more the outliers

boxplot(cars93$Price) #Some outliers
boxplot(d$price)      #Many Outliers

boxplot(cars93$RPM) #No outliers

boxplot(d$depth) #Too many outliers

#If we want to do boxplots for one col related to another col(Like group by)

boxplot(cars93$Price ~ cars93$Type) #Price for every category
boxplot(d$depth ~ d$cut) #Depth of diamond relating the cut
#IF we want to change the scale it is ylim for y axis and xlim for xaxis


###########SCATTERPLOT##########


plot(cars93$Price,cars93$MPG.city)

plot(cars93$Price,cars93$MPG.city,pch=18, col ="green")
#Pch stands for Plotting Character, its the legend that marks a data point
#Col for which color for the pch

plot(cars93$Price,cars93$MPG.city,pch=18, col ="green", xlab="Car Price", ylab="Miles per Gallon",
     main="Scatter")
#xlab = Xlabel
#ylab = Ylabel
#main=Name of the graph

########LINE PLOT###########

#For timeseries based graphs X axis should be time
#WHenever we plot against time its better to plot it as a linegraph
gas <- read.csv("Gasoline.csv")
plot(gas$Week, gas$Sales, type='l') #Type = l for lineplot
plot(gas$Week, gas$Sales, type='b')#Type = b for lineplot and show the data points

####DENSITY PLOT#####

#Like histogram, but smoothened
#Call density function on the data and then use Plot()
cars93$Price %>% density() %>% plot()

#OR

plot(density(cars93$Price))

#--------------------------------------------------------------------------------------#
#####################
#      GGPLOT2      #
#####################


sal <- read.csv("Salaries.csv", stringsAsFactors = T)

#For ggplot2, use function ggplot, specify the dataframe, then function aes[AESTHETIC] within it
#to specify what is gonna be x axis and y axis and then 
#USE "+" operator and pass the relevant plot function

#geom_point() for scatterplot

ggplot(data=sal, aes(x=yrs.service,y=salary)) + geom_point()

#If values correspond to specific groups/ranks/columns we can specify separate colors for them
#For rank
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point()

#For Gender
ggplot(data=sal, aes(x=yrs.service,y=salary,color=sex)) + geom_point()
#shape will change the shape of the plotting character instead for color
ggplot(data=sal, aes(x=yrs.service,y=salary,shape=rank)) + geom_point()

#4 things at a time, shape defined by rank, colors defined by sex
ggplot(data=sal, aes(x=yrs.service,y=salary,shape=rank, col=sex)) + geom_point
#Size regulates the size of plot depending upon a certain characteristic
ggplot(data=sal, aes(x=yrs.service,y=salary,size=yrs.since.phd)) + geom_point()


#Alpha defines transparency of plotting -- When alpha is defined it is also known as bubbleplot
ggplot(data=sal, aes(x=yrs.service,y=salary,size=yrs.since.phd, color=rank)) + geom_point(alpha=0.3)

#The different color shift for the years in Phd is called a gradient
ggplot(data=sal, aes(x=yrs.service,y=salary,color=yrs.since.phd)) + geom_point(alpha=0.3)


###Histogram using GGplot####
ggplot(data=cars93, aes(x=Price)) + geom_histogram(bins=10)

#Some aesthetic changes by providing color
ggplot(data=cars93, aes(x=Price)) + geom_histogram(bins=10, fill="pink", color="red")

###Boxplot using GGplot####
ggplot(data=cars93, aes(y=Price)) + geom_boxplot(fill="pink", color="red")

#Color changes for each type and the boxplot is generated pertaining to each type
ggplot(data=cars93, aes(y=Price,x=Type, fill=Type)) + geom_boxplot()

#If we only want to change border colors
ggplot(data=cars93, aes(y=Price,x=Type, color=Type)) + geom_boxplot()


ggplot(data=cars93, aes(y=Price,x=Type, color=Type)) + geom_boxplot()+coord_flip()
#coord_flip can flip any graph


###Density Plot####
#with color and x axis
ggplot(data=cars93, aes(x=Price)) + geom_histogram( fill="pink", color="red")

#If we want 2 factors fill in aes() of ggplot set to type 
#and specify alpha in the geom_density so that all graphs are seen
#even through overlap
ggplot(data=cars93, aes(x=Price, fill=Type)) + geom_density(alpha=0.3)


####Line Graph####
ggplot(data=gas, aes(x=Week, y=Sales)) + geom_line() 
ggplot(data=gas, aes(x=Week, y=Sales)) + geom_point() + geom_line() #Put geom_point to see data points too

###Facet Grid ###
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(.~rank)
#Use + facet grid to separate the graph on the basis of a factor/column

ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(rank~.)
#Flipping the positioning of the ~. we can get the partitions horizontally


#If we add another column/factor to facet grid it further subdivides the graph now to 6 partitions
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(rank~.~sex)
ggplot(data=sal, aes(x=yrs.service,y=salary,color=rank)) + geom_point() +facet_grid(sex~.~rank)

#------------------------------------------------------------------------------------------------#

#####################Interactive Graphics#########################


#Where the graph is dynamic based on what we choose

#Using something called shinyapp




