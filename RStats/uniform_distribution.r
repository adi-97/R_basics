##To check the uniform_distribution
a=5
b=10
x=runif(10000,a,b)
hist(x,breaks=20)
mu=1/2*(a+b)
sigma=sqrt(1/12*(b-a)^2)