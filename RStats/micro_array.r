#This script analysis affimetric microarray Cancer metadata

#Reading a data file into a data frame
dat=read.csv(file="all_data.csv",header=TRUE)

#print the column names
print(colnames(dat))

#print the dimensions of data (rows and columns)
print(dim(dat))

#to access any column as vectors
dat[1,1]

#show column1 1 to 100 rows
dat[1:100,1]

#show full rows column1
dat[,1]

#find the number of rows #normal1 can be name of any column name if all columns have same number of rows
length(dat$normal1)
print(length(dat$normal1))

#To find the minimum value in a column
min(dat$normal1,na.rm=TRUE)

#to find the maximum value in a column
max(dat$normal1,na.rm=TRUE)

#to find the mean value
mean(dat$normal1,na.rm=TRUE)

#fifth element of normal1 vector
print(dat$normal1[5])

#5th row seventh column
print(dat[5,7])

#5th row all columns
print(dat[5,])

#print the 4th column
print(dat[,4])
