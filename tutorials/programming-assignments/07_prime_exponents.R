# FUNCTIONS 07 [COMPLETE]
# write a simplified R function to find all the prime factors of a number with their exponents

prime_factors_exponents <- function(n) {
  factors <- list()
  i <- 2
  while (i * i <= n) {
    count <- 0
    while (n %% i == 0) {
      n <- n / i
      count <- count + 1
    }
    if (count > 0) {
      factors[[as.character(i)]] <- count
    }
    i <- i + 1
  }
  if (n > 1) {
    factors[[as.character(n)]] <- 1
  }
  return(factors)
}

exponent_list <- prime_factors_exponents(24)
primes <- names(exponent_list)
for (i in seq_along(exponent_list)) {
  cat("primefactor:", primes[i], ", exponent:", exponent_list[[i]], "\n")
}

