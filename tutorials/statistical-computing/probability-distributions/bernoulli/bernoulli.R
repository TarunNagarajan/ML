factorial_binomial <- function(n) {
  if ((n == 0) || (n == 1)) {
    return(1)
  }
  
  fact <- 1
  
  while (n > 0) {
    fact <- fact * n
    n <- n - 1
  }
  
  return(fact)
}

combinator_binomial <- function(n, r) {
  combinator_val <- factorial_binomial(n) / (factorial_binomial(n - r) * factorial_binomial(r))
  return(combinator_val)
}

binomial_probability <- function(n, k, p) {
  return(combinator_binomial(n, k) * (p^k) * ((1 - p)^(n - k)))
}

binomial_probability(1000, 100, 0.6)
dbinom(x = 100, size = 1000, prob = 0.6)
