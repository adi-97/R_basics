#Create a Gaussian plot
x=seq(0,14,0.2)
mu=7.0
sigma=1.6
pdens=1/sigma*(sqrt(2*pi))*exp(-0.5*((x-mu)/sigma)^2)
plot(x,pdens,type="l",lwd=2,col="blue")
 
#"Index" "Height.Inches" "Weight.Pounds"
dat=read.table(file="/home/ibab/Applications/RStats/SOCR_height_weight_data.txt", header = TRUE)
print(colnames(dat))

#No. of rows and columns
print(dim(dat))
#25000     3

#Plot the graph accordingly
height=dat$Height.Inches*2.5
weight=dat$Weight.Pounds*0.45
hist(height,col="blue",breaks=30)

#for stretching the axis
hist(height,col="blue",breaks=30,xlim=c(150,200),ylim=c(0,2500))

#we can use plot(x,y); lines(x,y); points(x,y);
x=seq(150,200,0.5)

ydens=dnorm(x,mean=mean(height),sd=sd(height))
#The above equation will give a density distribution

#for a frequency distribution we are multiplying the entire row of the data
yfr=ydens*nrow(dat)
dim(yfr)
#x11()
dim(x)
lines(x,yfr,col="yellow",lwd=2)

##FOR WEIGHT PLOT
#we can use plot(x,y); lines(x,y); points(x,y);

#The above equation will give a density distribution
#for a frequency distribution we are multiplying the entire row of the data
hist(weight,col="blue",breaks=30,xlim=c(0,100),ylim=c(0,2100))
hist(weight,col="blue",breaks=30)
x=seq(0,100,0.5)
ydens=dnorm(x,mean=mean(weight),sd=sd(weight))
yfr=ydens*nrow(dat)
lines(x,yfr,col="yellow",lwd=4)


#Plotting histogram of height deviation and weight deviation
#Unit Normal
z_height=(height-mean(height)/sd(height))
z_weight=(weight-mean(weight)/sd(weight))
hist(z_height,breaks=30,col="red")
x=seq(-5,5,0.1)
y=dnorm(x,mean=0,sd=1)
ydens=y*nrow(dat)
lines(x,ydens,col="blue",lwd=2)
hist(z_weight,breaks = 30,col = "purple")
############3333
par(mfrow=c(2,2))
hist(height,col="blue",breaks=30)
hist(weight,col="blue",breaks=30)
hist(z_height,breaks=30,col="red")
hist(z_weight,breaks=30,col="red")


