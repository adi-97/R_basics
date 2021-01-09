##POISSION DISTRIBUTION IN R:xvec=rbinom(10000,n,p)


#1. To find out the cumulative probability in R:
mu=6
x=3
p=ppois(x,mu)
print(p)
#0.1512039

#2. To find out x from the p value:
p=0.1512039
mu=6
x=qpois(p,mu)
##3
##????????????????????

#3.For a given x value, return probability density 
mu=6
x=3
density=dpois(x,mu)
print(density) 
#0.08923508

#4. Return m random deviates from poisson distribution
mu=6
m=5
xrand=rpois(m,mu)
print(xrand)
#4 8 5 6 2

#5.Plot the probability density function:
mu=6
x=seq(0,14,1)
dens=dpois(x,mu)
print(dens)
plot(x,dens,type="h")
x11()

##6.SIMULATION EXPERIMENT
##generate 10000 random deviates from poisson distribution
mu=6
xvec=rpois(10000,mu)
print(xvec[1:50])
#xvec is a sequence of 10,000 numbers.

##7.TABLE
xtab=table(xvec)
print(xtab)
#entries in the table are strings not numbers
#NEED: convert table to data frame
fr=data.frame(xtab)
print(fr)
#as.numeric is a function which converts string to number
plot(as.numeric(fr$xvec),as.numeric(fr$Freq),type="h")


