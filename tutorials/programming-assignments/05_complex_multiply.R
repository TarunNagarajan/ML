# FUNCTIONS 05 [COMPLETE]
# Write a function to perform multiplication of two complex numbers. The value parameters to the function should be real1, imag1m
# real2, imag2 and the reference parameters should be realpart and imagpart. The formula is

complex_multiply <- function(real1, imag1, real2, imag2) {
  real_part_result <- real1 * real2 - imag1 * imag2
  imag_part_result <- imag1 * real2 + real1 * imag2
  return(c(real_part_result, imag_part_result)) 
}

cat("(3 + 5i) * (7 + 9i)\n")
result <- complex_multiply(3, 5, 7, 9) 
real_part <- result[1] 
imag_part <- result[2] 
cat(real_part, "+ i", imag_part)
