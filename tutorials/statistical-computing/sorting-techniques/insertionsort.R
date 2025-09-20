insertion_sort <- function(x) {
  n <- length(x)
  for (i in 2:n) {
    key <- x[i]
    j <- i - 1
    while (j > 0 && x[j] > key) {
      x[j + 1] <- x[j]
      j <- j - 1
    }
    x[j + 1] <- key
  }
  return (x)
}