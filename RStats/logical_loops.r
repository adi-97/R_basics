#if else if statements
x=11
y=20
z=10
if(x<y){
  print("x less than y")
}
if(x<y){
  print("x less than y")
}else if(y>z){
  print("y greater than z")
}else{
  print("both not true")
}
##in case if 2 condtions were true, then the loop will stop once when the first condition is satisfied...

###WHILE LOOP
x=10
while(x>3){
  print(x)
  x=x-1
}
###The loop will run till the value of x becomes 3

####FOR LOOPS
##Two types
#first type: Directly access the elements
vec=c(10,20,30,40,50,60,70)
for(x in vec){
  print(x*100)
}
##second type: Access the elements using index
for(i in 1:length(vec)){
  print(vec[i]*100)
}

