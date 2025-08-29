# 10: write a program to create a 5x5 matrix, and find the sum of diagonal using for loop
# [COMPLETE]

# assuming that we are asked the sum of elements along the leading diagonal
matrix_elements = sample(1:25, 25, replace = FALSE)
test_matrix = matrix(matrix_elements, nrow = 5, ncol = 5, byrow = TRUE)

m <- nrow(test_matrix)
n <- ncol(test_matrix)

cat("Original Matrix:\n")
test_matrix

for (i in 1:m) {
  print(test_matrix[i, i])
}


