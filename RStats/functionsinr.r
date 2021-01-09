##functions in R

##define a function in R:--
res<-function(length,width){
  area=length*width
  return(area)
}

###Checking how a function works
##First way::
res(10,20)  
area=res(10,20)
print(area)

##Second way::
area=res(length=10,width=20)
print(area)

###in a function, an entire data frame can be used. Just use the required keywords

