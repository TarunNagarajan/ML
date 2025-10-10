set.seed(123)

population_sales <- rexp(5000, rate = 0.0005)
population_mean <- mean(population_sales)

repetitions <- 1000

means_n10 <- replicate(repetitions, mean(sample(population_sales, 10, replace = TRUE)))
means_n100 <- replicate(repetitions, mean(sample(population_sales, 100, replace = TRUE)))
means_n1000 <- replicate(repetitions, mean(sample(population_sales, 1000, replace = TRUE)))

par(mfrow = c(2, 2))

hist(population_sales,
     main = "Original Population Distribution",
     xlab = "Daily Sales",
     freq = FALSE,
     col = "darkorange",
     border = "white")
lines(density(population_sales), col = "black", lwd = 2)

plot_xlim <- c(min(means_n10), max(means_n10))

hist(means_n10,
     main = "Sample Means (n=10)",
     xlab = "Average Daily Sales",
     freq = FALSE,
     xlim = plot_xlim,
     col = "lightblue",
     border = "white")
abline(v = population_mean, col = "red", lwd = 2, lty = 2)

hist(means_n100,
     main = "Sample Means (n=100)",
     xlab = "Average Daily Sales",
     freq = FALSE,
     xlim = plot_xlim,
     col = "lightblue",
     border = "white")
abline(v = population_mean, col = "red", lwd = 2, lty = 2)

hist(means_n1000,
     main = "Sample Means (n=1000)",
     xlab = "Average Daily Sales",
     freq = FALSE,
     xlim = plot_xlim,
     col = "lightblue",
     border = "white")
abline(v = population_mean, col = "red", lwd = 2, lty = 2)

par(mfrow = c(1, 1))
