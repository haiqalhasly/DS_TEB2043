# Array 1 -> 4 cols, 2 rows, 3 tables

vector1 <- matrix(c(1:8), ncol = 4, nrow = 2)
vector2 <- matrix(c(9:16), ncol = 4, nrow = 2)
vector3 <- matrix(c(17:24), ncol = 4, nrow = 2)

array1 <- array(c(vector1,vector2,vector3), dim = c(2,4,3))
print("--- Array 1 ---")
print(array1)

# Array 2 -> 2 cols, 3 rows, 5 tables

vector4 <- matrix(c(25:30), ncol = 2, nrow = 3)
vector5 <- matrix(c(31:36), ncol = 2, nrow = 3)
vector6 <- matrix(c(37:42), ncol = 2, nrow = 3)
vector7 <- matrix(c(43:48), ncol = 2, nrow = 3)
vector8 <- matrix(c(49:54), ncol = 2, nrow = 3)


array2 <- array(c(vector4,vector5,vector6, vector7, vector8), dim = c(3,2,5))
print("--- Array 2 ---")
print(array2)

# print 2nd row of 2nd matrix of 1st array
print("The second row of the second matrix of the array:")
print(array1[2,,2])

# print element in 3rd row  and 3rd cols of first matrix of 2nd array

print("The element in the 3rd row and 3rd column of the 1st matrix:")
print(array2[3,2,1])

print("Note: the are only 2 columns in 2nd array so, if used 3rd columns will be out of bound. Here we choose 2nd column.")
