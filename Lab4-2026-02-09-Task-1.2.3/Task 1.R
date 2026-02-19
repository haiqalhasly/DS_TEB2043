age = c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,
        52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58)

age_df <- data.frame(age=age)
age_factor <- factor(age)
levels(age_factor)
print(table(age_factor))

age_groups <- cut(age,
                  breaks = c(50,52,54,56,58,61),
                  labels = c("50-52", "52-54", "54-56", "56-58", "58-60"),
                  right = FALSE) #to include starting number too

 print(table(age_groups))
