# Create the original matrix
matrix_elements = sample(1:10, 10, replace = TRUE)
matrix_test = matrix(matrix_elements, nrow = 2, ncol = 5, byrow = TRUE)

num_rows_orig <- nrow(matrix_test)
num_cols_orig <- ncol(matrix_test)

matrix_transpose_manual <- matrix(nrow = num_cols_orig, ncol = num_rows_orig)

for (i in 1:num_rows_orig) {
  for (j in 1:num_cols_orig) {
    matrix_transpose_manual[j, i] <- matrix_test[i, j]
  }
}

cat("Original Matrix: \n")
print(matrix_test)

cat("Manually Transposed Matrix: \n")
print(matrix_transpose_manual)
