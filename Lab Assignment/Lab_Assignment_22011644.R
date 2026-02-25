library(stringr)
library(readr)
# Load dataset
path <- "C:/Users/Lenovo Haiqal/Desktop/DS_TEB2043/Lab Assignment/Unclean Dataset.csv"

#data <- read.csv("C:\\Users\\Lenovo Haiqal\\Desktop\\DS_TEB2043\\Lab Assignment\\Unclean Dataset.csv")
#print(head(data,5))

#the data looks weird so,

data <- read.table(path,
                   sep = "|",
                   header = FALSE,
                   skip = 1,
                   fill = TRUE,
                   strip.white = TRUE)

colnames(data) <- c("Student_ID", "First_Name", "Last_Name", "Age", 
                    "Gender", "Course", "Enrollment_Date", "Total_Payments")
print(head(data,5))

# Check for duplicates, null values, data types, summary and header
print(paste("num of col: ",ncol(data)))
print(paste("num of row: ", nrow(data)))
#print(is.na(data))
print(paste("total null value: ", sum(is.na(data))))
print("datatypes: ")
print(str(data))
print("Summary: ")
print(summary(data))


# Delete duplicate
df_cleaned <- data
df_removed <- data.frame()
rows_to_remove <- c()

for (i in 2:nrow(data))
{
  for (j in 1:(i-1))
  {
    if (data[i, 2] == data[j,2])
    {
      rows_to_remove <- c(rows_to_remove,i)
      
    }
  }
}

df_cleaned <- df_cleaned[-rows_to_remove,]
print(head(df_cleaned))
print(paste("num of col: ",ncol(df_cleaned)))
print(paste("num of row: ", nrow(df_cleaned)))
print("Duplicate rows removed")

# Remove ,,,,, in date

data$Total_Payments <- str_remove(data$Total_Payments, "\\$")
data$Total_Payments <- str_remove_all(data$Total_Payments, ",")

# Converting data types

data$Student_ID <- as.numeric(data$Student_ID)
data$Age <- as.numeric(data$Age)
data$Gender <- as.factor(data$Gender)
data$Course <- as.factor(data$Course)
data$Enrollment_Date <- as.Date(data$Enrollment_Date)
data$Total_Payments <- as.numeric(data$Total_Payments)

print("datatypes: ")
print(str(data))

# Handling missing values
# - Numerical type column -> median
# - Categorical type column -> mode
print(paste("total null value: ", sum(is.na(data))))
# write.csv (data , file= 'df_cleanedStudent.csv')

df_cleaned <- data
df_removed <- data.frame()
rows_to_remove <- c()

# Remove NA Student ID
for (i in 2:nrow(data))
{
    if (is.na(data[i, 1]) == TRUE)
    {
      rows_to_remove <- c(rows_to_remove,i)
      }
}

df_cleaned <- df_cleaned[-rows_to_remove,]
print(head(df_cleaned, 16))

#write.csv (df_cleaned , file= 'cleanedStudent.csv')

# Handling Enrolment Date
#Find mode
date_counts <- table(df_cleaned$Enrollment_Date)
date_mode <- names(date_counts)[which.max(date_counts)]
print(paste("The most frequent enrollment date is:", date_mode))

df_cleaned$Enrollment_Date[is.na(df_cleaned$Enrollment_Date)] <- as.Date(date_mode)

print(head(df_cleaned, 16))

# Handling total_payments
payments_counts <- table(df_cleaned$Total_Payments)
payments_mode <- names(payments_counts)[which.max(payments_counts)]
print(paste("Mode of payments: ", payments_mode))

df_cleaned$Total_Payments[is.na(df_cleaned$Total_Payments)] <- as.numeric(payments_mode)

print(head(df_cleaned, 16))

# Standardize Course names
df_cleaned$Course <- gsub("Machine Learnin", "Machine Learning", df_cleaned$Course)
df_cleaned$Course <- gsub("Machine Learningg", "Machine Learning", df_cleaned$Course)
df_cleaned$Course <- gsub("Web Developmen", "Web Development", df_cleaned$Course)
df_cleaned$Course <- gsub("Web Developmentt", "Web Development", df_cleaned$Course)

# Convert to factor again to refresh the levels
df_cleaned$Course <- as.factor(df_cleaned$Course)

# Convert empty strings to actual NA
df_cleaned[df_cleaned == ""] <- NA


# Remove id in total payments

# take last 3 digits in the total payments (last_digit)
# Step 1: Convert the number to a character string

payment_str <- as.character(df_cleaned$Total_Payments)
print(head(payment_str))

# Step 2: Use gsub() to insert a delimiter (space) between each digit
pay_with_spaces <- gsub("(.)", "\\1 ", payment_str)
print(str(pay_with_spaces))

# Step 3: Use strsplit() to split the string on the delimiter
for (i in 1:length(pay_with_spaces)){
  digits = c()
  digits <- strsplit(pay_with_spaces[i], " ")[[1]]
  
  last_3_string <- paste(tail(digits, 3), collapse = "")
  last_3_num <- as.numeric(last_3_string)
  
  # Step 4: Convert the result back to numeric
  
  #digits_numeric <- as.numeric(digits)

  #last_3_digits = tail(digits_numeric,3)

  
  if (last_3_num == df_cleaned$Student_ID[i]){
    df_cleaned$Total_Payments[i] <- as.numeric(substr(as.character(df_cleaned$Total_Payments[i]), 1, nchar(as.character(df_cleaned$Total_Payments[i])) - 3))
  }
  
}

print(head(df_cleaned))


# compare last_digit with id. if same remove.

# write new file called cleaned*
write.csv (df_cleaned , file= 'cleanedStudent.csv')
