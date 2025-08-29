# 08: Create a 3x3 matrix with number and find its transpose
# [COMPLETE]

matrix_elements = sample(1:10, 10, replace = TRUE)
matrix_test = matrix(matrix_elements, nrow = 2, ncol = 5, byrow = TRUE)
matrix_transpose = t(matrix_test)

cat("Original Matrix: \n")
matrix_test
cat("Transposed Matrix: \n")
matrix_transpose
