# 03: implement bubble sort in R 
# [COMPLETED]

bubble_sort <- function(x) {
  n <- length(x)
  for (i in 1: (n - 1)) {
    for (j in 1: (n - i)) {
      if (x[j] > x[j + 1]) {
        temp <- x[j]
        x[j] <- x[j + 1]
        x[j + 1] <- temp
      }
    }
  }
  return(x)
}

random_integers <- sample(1:100, 10, replace = TRUE)
cat("Original Array:", random_integers)
cat("Sorted Array (Bubble Sort): ", bubble_sort(random_integers))

