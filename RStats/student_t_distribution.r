########student_t_distribution.r
p_value=pt(2.5,10)
#pt is the distribution function,the syntax of pt is like pt(q,df), where df us the degree if freedom and 
q_norm=qt(0.95,10)
#qt is the quartile function and it is similar to that of qnorm, and its syntax is qt(p,df) where q is the vector of probabilities
random_deviates=rt(10,10)
#rt generates random values; syntax rt(n,df), where n is the number of observations
density_function=dt(0.5,10)
#dt is the density
pt(t,n-1) ##similar to pnorm
pt(2.5,10)
qt(0.95,10)     ##similar to qnorm
dt(t,n-1)    ##similar to dnorm
dt(2.5,10)
rt(m,n-1) ##returns m random
rt(2.5,10)


##binomial distribution in R

n=10 #no: of Bernoulli trails
t=5 #prob of success in a trail

#1 For a given x value, return cumulative prob upto x (p value)

pvalue=pt(t,(n-1))
print(pvalue)


#2 for given p-value, return corresponding x values
pvalue=0.66
x=qt(pvalue,n-1)
##print(x)

#3 for a given x value, return probability density p(x)
density=dt(pvalue,n-1)
print(density)


#4 return m random deviates from binomial distribution
##m=5
xrand=rt(pvalue,n-1)
print(xrand)


#5 plot probability density function
x=seq(0,10,1)
dens=dt(x,n-1)
print(dens)
par(mfrow=c(3,1))
plot(x,dens,type="h")

#6 generate 10,000 random deviates from binomial distribution
xvec=rt(10000,n-1)
print(xvec[1:50])

xtab=table(xvec) #entries in a table are string not numbers, convert to num.
print(xtab)      #convert the table into data frame

fr=data.frame(xtab) #these are string,need to convert
print(fr)
##XII() #produces new canvas so that the previous plot will not get overriden.
plot(as.numeric(fr$xvec), as.numeric(fr$Freq), type="h")



x=seq(0,11,1)
dens=dt(x,n-1)
print(dens)
plot(x,dens,type="h")

a <- 5
> s <- 2
> n <- 20
> error <- qt(0.975,df=n-1)*s/sqrt(n)
> left <- a-error
> right <- a+error
> left
[1] 4.063971
> right
[1] 5.936029



