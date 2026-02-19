v1 = c(2,3,1,5,4,6,8,7,9)

# Define the column and row names.
rownames = c("row1", "row2", "row3")
colnames = c("col1", "col2", "col3")

# create two 3x3 matrix - Matrix-1
matrix1 <- matrix(data = v1,nrow=3,ncol=3, 
                  dimnames = list(rownames, colnames))

print("--- Matrix 1 ---")
print(matrix1)

# transpose Matrix-1 to create Matrix-2 (rename row & col)

matrix2 <- t(matrix1)
print("--- Matrix 2 (Transpose) ---")
print(matrix2)

# Addition
add <- matrix1 + matrix2
print("--- Addition ---")
print(add)
# Subtract
sub <- matrix1-matrix2
print("--- Subtraction ---")
print(sub)
# Multiply
multi <- matrix1*matrix2
print("--- Multiplication ---")
print(multi)
# Divide
div <- matrix1/matrix2
print("--- Division ---")
print(div)