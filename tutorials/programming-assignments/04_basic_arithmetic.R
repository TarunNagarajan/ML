# 04: create two vectors and perform element-wise addition, subtraction, multiplication
# [COMPLETE]

# ensure that both vectors are of the same size
vector_01 = sample(1:100, 10, replace = FALSE)
vector_02 = sample(1:100, 10, replace = FALSE)

result_mult <- c()
result_add <- c()
result_sub <- c()

n <- length(vector_01)

# dot-product multiplication
for (i in 1:n) {
  result_mult[i] = vector_01[i] * vector_02[i]
  result_add[i] = vector_01[i] + vector_02[i]
  result_sub[i] = vector_01[i] - vector_02[i]
}

cat("Original Vectors: \n")
cat("Vector 01: ", vector_01, "\n")
cat("Vector 02: ", vector_02, "\n")

cat("Results: \n")
cat("Dot Product:", result_mult, "\n")
cat("Addition: ", result_add, "\n")
cat("Subtraction: ", result_sub, "\n")

