# Check leap year 
year <- as.numeric(readline(prompt="Input year : "))

if (year %% 4 == 0){
  print(paste( year ,"is a leap year"))
} else {
  print(paste( year ,"is a not leap year"))
}
#Input year: 2004 
#Output: 2004 is a leap year.                                                                                     
#Input year: 1900 
#Output: 1900 is a not leap year.
