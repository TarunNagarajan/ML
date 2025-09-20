quicksort <- function(nums) {
  if (length(nums) <= 1) {
    return (nums)
  }
  
  pivot <- nums[1]
  rest <- nums[-1]
  
  left <- rest[rest <= pivot]
  right <- rest[rest > pivot]
  
  return (c(quicksort(left), pivot, quicksort(right)))
}

partition <- function(nums, left, right) {
  pivot <- nums[high]
  i <- low - 1
  
  for (j in low:(high - 1)) {
    if (nums[j] <= pivot) {
      i <- i + 1
      temp <- nums[i]
      nums[i] <- nums[j]
      nums[j] <- temp
    }
  }
  
  temp <- nums[high]
  nums[high] <- nums[i + 1]
  nums[i + 1] <- temp
  
  return (list(nums = nums, pivot_index = i + 1))
}

quicksort <- function(nums, left, right) {
  if (low < high) {
    result = partition(nums, left, right)
    pi <- result$pivot_index
    nums <- result$nums
    nums <- quicksort(nums, left, pi - 1)
    nums <- quicksort(nums, pi + 1, right)
  }
  return (nums)
}