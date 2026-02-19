print("Check whether an n digits number is Armstrong or not:")
print(paste("----------------------------------------------------------- "))
ori_number <- as.numeric(readline(prompt = "Input an integer: "))

number <- ori_number
int_list <- list()
# split number
while (number > 0) {
  digit = number %% 10
  int_list <- append(int_list, list(c=digit))
  number = number %/%10
}

int_list <- rev(int_list)
int_list <- as.integer(int_list)
#print(int_list)

n_power <- length(int_list)

# raised power to 3

for (i in seq_along(int_list)){
  int_list[i] = int_list[i]**n_power
}
  
# add all number (sum) 
total_sum <- 0
for (i in seq_along(int_list)){
  total_sum = total_sum+int_list[i] 
}

#print(total_sum)

# if sum == number

if (total_sum == ori_number){
  print(paste(ori_number, " is an Armstrong number."))
} else{
  print(paste(ori_number, " is not an Armstrong number."))
}