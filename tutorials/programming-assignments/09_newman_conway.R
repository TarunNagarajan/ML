# FUNCTIONS 09 [COMPLETE]
# recursive solution for the NEWMAN CONWAY SEQUENCE

# (P(P(n - 1)))
P <- function(n) {
  if (n == 1 || n == 2) {
    return (1)
  }
  
  # else if n >= 3
  return (P(P(n - 1)) + P(n - P(n - 1)))
}

n <- 10
cat("nth TERM OF NEWMAN CONWAY SEQUENCE FOR n =", n,":", P(n))

