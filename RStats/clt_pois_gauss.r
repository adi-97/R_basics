#xvec=rnorm(10,mean=6,sd=1.5)
#print(xvec)
###to generate random variables(x bar)
##Central limit theorem by sampling from Gaussian

sigma=1.732
xbar_vec=c()
n=16
z_vec=c()
mu=3
#^to create an empty vector, which can be appended later
for(i in 1:10000){
  x=rpois(n,mu)
  xbar=mean(x)
  xbar_vec=c(xbar_vec,xbar)
  ##This will add the value of xbar to xbar_vec
  ##appending
  z=(xbar-mu)/(sigma/sqrt(n))
  z_vec=c(z_vec,z)
}
xvec=rpois(10000,mu)
par(mfrow=c(3,1))
hist(xvec,breaks=30,xlim=c(0,10))
hist(xbar_vec,breaks = 30)
hist(z_vec,breaks=20)
print(mean(xvec))
print(sd(xvec))
print(mean(xbar_vec))
print(sd(xbar_vec))
