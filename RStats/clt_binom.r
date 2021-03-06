#xvec=rnorm(10,mean=6,sd=1.5)
#print(xvec)
###to generate random variables(x bar)
##Central limit theorem by sampling from Gaussian
n=10 
p=0.5
#mu=12
#sigma=2.5
xbar_vec=c()
n=16
z_vec=c()
#^to create an empty vector, which can be appended later
for(i in 1:10000){
  x=rbinom(10000,n,p)
  xbar=mean(x)
  xbar_vec=c(xbar_vec,xbar)
  ##This will add the value of xbar to xbar_vec
  z=(xbar-mu)/(sigma/sqrt(n))
  z_vec=c(z_vec,z)
}
xvec=xbinom(10000,n,p)
par(mfrow=c(3,1))
hist(xvec,breaks=30)
hist(xbar_vec,breaks = 30)
hist(z_vec,breaks=20)
print(mean(xvec))
print(sd(xvec))
print(mean(xbar_vec))
print(sd(xbar_vec))

