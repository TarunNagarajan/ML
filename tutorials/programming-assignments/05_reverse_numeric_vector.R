# 05: R program to reverse a vector
# [COMPLETE]

reverse_vector <- function(x) {
  # I'll reverse it using the two pointer approach
  l <- 1
  r <- length(x)
  while (l < r) {
    # write manual swapping logic: DONE
    temp <- x[l]
    x[l] <- x[r]
    x[r] <- temp
    
    # advance the pointers
    l <- l + 1
    r <- r - 1
  }
  return(x)
}

x <- sample(1:100, 10, replace = FALSE)
cat("Original Vector: ", x)
reversed_x = reverse_vector(x)
cat("Reversed Vector: ", reversed_x)

