bubblesort <- function(nums) {
  n <- length(nums)
  for (i in 1:(n - 1)) {
    for (j in 1:(n - i)) {
      if (nums[j] > nums[j + 1]) {
        temp <- nums[j]
        nums[j] <- nums[j + 1]
        nums[j + 1] <- temp
      }
    }
  }
  return (nums)
}
