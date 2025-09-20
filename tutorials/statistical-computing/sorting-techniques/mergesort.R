merge_vectors <- function(left, right) {
  result <- c()
  while (length(left) > 0 && length(right) > 0) {
    if (left[1] <= right[1]) {
      result <- c(result, left[1]) 
      left <- left[-1]
    } else {
      result <- c(result, right[1])
      right <- right[-1]
    }
  }
  return (c(result, left, right))
}

merge_sort <- function(x) {
  if (length(x) <= 1) {
    return(x)
  } 
  
  mid <- floor(length(x) / 2)
  left <- x[1: mid]
  right <- x[(mid + 1):length(x)]
  
  left_sorted <- merge_sort(left)
  right_sorted <- merge_sort(right)
  
  return (merge_vectors(left_sorted, right_sorted))
}
