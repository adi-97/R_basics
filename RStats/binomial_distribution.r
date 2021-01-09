#Simulating BIONOMIAL DISTRIBUTION IN R:

n=10 #This is the number of bernoulli's trials
p=0.5 #probability of success in a trial

#1. For a given x value, return cumulative probability upto x (pvalue)
x=7
pvalue=pbinom(x,n,p)
#pbinom syntax()
print(pvalue)
#0.9453125
#which is the cumulative probability from x=0 to 7

#2.From pvalue, return corresponding x value:
#reverse of the first one
pvalue=0.66
x=qbinom(pvalue,n,p)
print(x)
qbinom(1,n,p)
#10

#3.For a given x value, return probability density 
#the word pd is used in all the distributions, in binomial distribution it is just the actual probability.
density=dbinom(x,n,p)
print(density) 
#0.2050781
#this is used for plotting the probability distributions

#4. Return m random deviates from binomial distribution
m=5
xrand=rbinom(m,n,p)
print(xrand)
#4 4 4 4 6
#random sequences are introduced#everytime it is different for everyone as it is RANDOM

##There is an index of random numbers.


#5.Plot the probability density function:
x=seq(0,10,1)
dens=dbinom(x,n,p)
print(dens)
plot(x,dens,type="h")
#y axis= probability density
#x axis= range of x

###6.SIMULATION EXPERIMENT
#Simulation involing random numbers is referred to as "MONTE CARLO" simulation
##generate 10000 random deviates from Binomial distribution
xvec=rbinom(10000,n,p)
print(xvec[1:50])
#xvec is a sequence of 10,000 numbers.

#7.plot the sequence of 10,000 numbers 
#TABLE will classify the sequence and tell us the frequency of each element
xtab=table(xvec)
print(xtab)
#entries in the table are strings not numbers
#NEED: convert table to data frame
fr=data.frame(xtab)
print(fr)
#as.numeric is a function which converts string to number
plot(as.numeric(fr$xvec),as.numeric(fr$Freq),type="h")

#x11() will create a new canvas for a new plot.  x11() has to be used before every new plot
#keiro
