library(readxl)
library(dplyr)

titanic <- read.csv("./Lab7/titanic.csv")

titanic$Age <- round(titanic$Age, 0)

age_mean <- mean(titanic$Age, na.rm = TRUE)

age_mean <- round(age_mean, 0)
print(paste("mean age: ", age_mean))

titanic$Age[is.na(titanic$Age)] <- as.numeric(age_mean)


print(paste("num of col: ",ncol(titanic)))
print(paste("num of row: ", nrow(titanic)))

titanic_count <- 0

survived = sum(titanic$Survived == 1)
print(paste("Number of people survived:", survived))

first_class_surv <- 0
second_class_surv <- 0
third_class_surv <- 0

for (i in 1:nrow(titanic)){
  if (titanic$Pclass[i] == 1 && titanic$Survived[i] == 1){
    first_class_surv <- first_class_surv + 1
  }
  else if (titanic$Pclass[i] == 2 && titanic$Survived[i] == 1){
    second_class_surv <- second_class_surv + 1
  }
  else if (titanic$Pclass[i] == 3 && titanic$Survived[i] == 1){
    third_class_surv <- third_class_surv + 1
  }
}

num_row <- nrow(titanic)

first_class_percent <- (first_class_surv / num_row) *100
second_class_percent <- (second_class_surv / num_row) *100
third_class_percent <- (third_class_surv / num_row) *100

print(paste("Percentage of people that survived in 1st class: ", round(first_class_percent, 2), "%"))
print(paste("Percentage of people that survived in 2nd class: ", round(second_class_percent, 2), "%"))
print(paste("Percentage of people that survived in 3rd class: ", round(third_class_percent, 2), "%"))


female_1st_surv <- 0
male_1st_surv <- 0
total_1st_class <- 0

for (i in 1:nrow(titanic)) {
  
  if (titanic$Pclass[i] == 1) {
    total_1st_class <- total_1st_class + 1
    
    
    if (titanic$Sex[i] == "female" && titanic$Survived[i] == 1) {
      female_1st_surv <- female_1st_surv + 1
    }
    
    
    if (titanic$Sex[i] == "male" && titanic$Survived[i] == 1) {
      male_1st_surv <- male_1st_surv + 1
    }
  }
}

# Calculate percentages relative to the whole ship
female_pct <- (female_1st_surv / nrow(titanic)) * 100
male_pct <- (male_1st_surv / nrow(titanic)) * 100

# Print Insights
print(paste("Percentage 1st Class Female Survivors:", round(female_pct,2), "%"))
print(paste("Percentage 1st Class Male Survivors:", round(male_pct,2), "%"))


boxplot( titanic ~ survived, data = titanic, xlab = "Class", 
       ylab = "Total Number", main = "Percentage of people survived by class") 