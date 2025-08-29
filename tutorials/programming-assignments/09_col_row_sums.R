# 09: Create a 4x4 matrix, and find the sum of the elements in the row and columns
# [COMPLETE]

matrix_elements = sample(1:16, 16, replace = FALSE)
test_matrix = matrix(matrix_elements, nrow = 4, ncol = 4, byrow = TRUE)

# test_matrix
cat("Original Matrix\n")
test_matrix

# matrix header
m <- nrow(test_matrix)
n <- ncol(test_matrix)

row_sums = rowSums(test_matrix)
# row_sums
for (i in 1:m) {
  cat("Sum of Row", i, ":", row_sums[i], "\n")
}

col_sums = colSums(test_matrix)
# col_sums
for (j in 1:n) {
  cat("Sum of Column", j, ":", col_sums[j], "\n")
}
