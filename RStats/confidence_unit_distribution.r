###check if it lies in the confidence interval
mu=16
sigma=3
n=16
result=c()
for(i in 1:1000)
{
  x=rnorm(n,mu,sigma)
  xbar=mean(x)
  alpha=0.1
  lower_interval=xbar-(qnorm((1-(alpha/2)*sigma/sqrt(n))))
  upper_interval=xbar+(qnorm((1-(alpha/2)*sigma/sqrt(n))))
  if((mu>lower_interval)&(mu<upper_interval)){
    result=c(result,"insideinterval")
  }else{
    result=c(result,"outsideinterval")
    }
}
counts_inside=length(subset(result,result=="insideinterval"))
counts_outside=length(subset(result,result=="outsideinterval"))
print(counts_inside)
print(counts_outside)

