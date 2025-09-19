# 01: POISSON DISTRIBUTION - Probability Mass Function [COMPLETE]

lambda <- 4
k_values <- 1:10

factorial_pd <- function(n) {
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

pd_pmf <- function(k, lambda) {
  return((exp(-lambda) * (lambda^k)) / factorial_pd(k))
}

cat("--- POISSON DISTRIBUTION ---\n")
pd_cdf <- 0
pmf_values <- numeric(length(k_values)) 

for (i in seq_along(k_values)) {
  k <- k_values[i]
  pd_pmf_step <- pd_pmf(k, lambda)
  pd_cdf <- pd_cdf + pd_pmf_step
  pmf_values[i] <- pd_pmf_step  

  cat(sprintf("PMF(%d, %d) = %.6f\n", k, lambda, pd_pmf_step))
}

cat(sprintf("CDF(1 to %d, lambda=%d) = %.6f\n", max(k_values), lambda, pd_cdf))


plot(k_values, pmf_values, 
     type = "h",
     lwd = 3,    
     col = "blue",
     main = sprintf("Poisson Distribution PMF (lambda = %d)", lambda),
     xlab = "k (number of events)",
     ylab = "P(X = k)",
     ylim = c(0, max(pmf_values) * 1.1))

points(k_values, pmf_values, pch = 16, col = "red", cex = 1.2)

grid(col = "lightgray", lty = "dotted")

text(k_values, pmf_values + max(pmf_values) * 0.05, 
     labels = sprintf("%.4f", pmf_values), 
     cex = 0.8, col = "darkblue")
