#xvec=rnorm(10,mean=6,sd=1.5)
#print(xvec)
###to generate random variables(x bar)
##Central limit theorem by sampling from Gaussian
##To check the uniform_distribution
a=5
b=10
x=runif(10000,a,b)
hist(x,breaks=20)
mu=1/2*(a+b)
sigma=sqrt(1/12*(b-a)^2)
xbar_vec=c()
n=16
z_vec=c()
#^to create an empty vector, which can be appended later
for(i in 1:100000){
  x=runif(n,a,b)
  xbar=mean(x)
  xbar_vec=c(xbar_vec,xbar)
  ##This will add the value of xbar to xbar_vec
  z=(xbar-mu)/(sigma/sqrt(n))
  z_vec=c(z_vec,z)
}
xvec=runif(10000,a,b)
par(mfrow=c(3,1))
hist(xvec,breaks=30,xlim=c(0,15))
hist(xbar_vec,breaks = 30,xlim=c(0,15))
hist(z_vec,breaks=20)
print(mean(xvec))
print(sd(xvec))
print(mean(xbar_vec))
print(sd(xbar_vec))
####From
