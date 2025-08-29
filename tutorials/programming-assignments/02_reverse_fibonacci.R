# RECURSION 02: Reverse Fibonacci [COMPLETE]

reverse_fibonacci <- function(n) {
  fib_helper <- function(count, a = 0, b = 1) {
    if (count <= 0) {
      return()
    }
    
    fib_helper(count - 1, b, a + b)
    
    cat(a, " ")
  }
  
  if (n > 0) {
    fib_helper(n)
  }
  
  cat("\n")
}

test <- 10
cat("Reverse Fibonacci for n =", test, "\n")
reverse_fibonacci(test)