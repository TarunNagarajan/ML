# 01: Manual Implementation of Simple Linear Regression

data(mtcars)
dim(mtcars)
head(mtcars)

w <- 0
b <- 0

plot(mtcars$wt, mtcars$mpg,
     main = "MPG vs. Weight",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles per Gallon",
     pch = 19,
     col = "blue")

predict <- function(X) {
  return (X * w + b)
}

# utility function: sum of squares
ss <- function(vector) {
  summation <- 0
  n <- length(vector)
  for (i in (1:n)) {
    summation <- summation + (vector[i] * vector[i])
  }
  return (summation)
}

# set default n_iter: 10000
fit <- function(X, y, lr = 0.01, n_iter = 10000) {
  n_samples <- length(X)
  
  w <<- 0.0
  b <<- 0.0
  
  for (i in (1:n_iter)) {
    y_pred <- predict(X)
    error <- y_pred - y
    
    dw <- (2 / n_samples) * sum(X * error)
    db <- (2 / n_samples) * sum(error)
    
    w <<- w - (lr * dw)
    b <<- b - (lr * db)
    
    if (i %% 50 == 0) {
      loss <- mean(error ^ 2)
      cat("Iteration: ", i, "| Loss:", loss, "\n")
    }
  }
}

score <- function(X, y) {
  y_pred <- predict(X)
  
  ss_total <- ss(y - mean(y))
  ss_res <- ss(y - y_pred)
  
  return (1 - (ss_res / ss_total))
}

X <- mtcars$wt
y <- mtcars$mpg

fit(X, y)
abline(b, w, col = "red", lwd = 2)
cat("R-squared:", score(X, y), "\n")
