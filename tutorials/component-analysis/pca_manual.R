feature1 <- c(4, 8, 13, 7)
feature2 <- c(11, 4, 5, 4)

mean_f1 <- sum(feature1) / length(feature1)
mean_f2 <- sum(feature2) / length(feature2)

f1_normalized <- feature1 - mean_f1
f2_normalized <- feature2 - mean_f2

n <- length(feature1)
cov_11 <- sum(f1_normalized * f1_normalized) / (n - 1)
cov_22 <- sum(f2_normalized * f2_normalized) / (n - 1)
cov_12 <- sum(f1_normalized * f2_normalized) / (n - 1)

trace <- cov_11 + cov_22
determinant <- cov_11 * cov_22 - cov_12 * cov_12

a <- 1
b <- -trace
c <- determinant

discriminant <- b^2 - 4*a*c
lambda1 <- (-b + sqrt(discriminant)) / (2*a)
lambda2 <- (-b - sqrt(discriminant)) / (2*a)

a11 <- cov_11 - lambda1
a12 <- cov_12
if (a12 != 0) {
  v1 <- c(1, -a11 / a12)
} else {
  v1 <- c(1, 0)
}
v1 <- v1 / sqrt(sum(v1^2))

a21 <- cov_11 - lambda2
a22 <- cov_12
if (a22 != 0) {
  v2 <- c(1, -a21 / a22)
} else {
  v2 <- c(1, 0)
}
v2 <- v2 / sqrt(sum(v2^2))

projection1 <- f1_normalized * v1[1] + f2_normalized * v1[2]
projection2 <- f1_normalized * v2[1] + f2_normalized * v2[2]

cat("Normalized Feature 1:\n"); print(f1_normalized)
cat("Normalized Feature 2:\n"); print(f2_normalized)

cat("\nCovariance Matrix:\n")
print(matrix(c(cov_11, cov_12, cov_12, cov_22), nrow=2, byrow=TRUE))

cat("\nEigenvalues:\n")
print(c(lambda1, lambda2))

cat("\nEigenvectors:\n")
print(v1)
print(v2)

cat("\nProjection onto PC1:\n")
print(projection1)

cat("\nProjection onto PC2:\n")
print(projection2)
