# 01: Population Sampling for Sales Distribution
getwd()
setwd("Z:/STP/24CSB0A79/Lab Session 9")
df <- read.csv("datasets\\sales_data_sample.csv")

population_sales <- df$SALES[!is.na(df$SALES)]

par(mfrow = c(2, 2))

hist(population_sales,
     main = "Original Distribution of Sales",
     xlab = "Sales Value",
     ylab = "Density",
     freq = FALSE,
     col = "skyblue",
     border = "white")
lines(density(population_sales), col = "red", lwd = 2)

num_of_samples_to_take <- 1000

sample_means_n5 <- c()

for (i in 1:num_of_samples_to_take) {
  df_sample <- sample(population_sales, 5, replace = TRUE)
  df_sample_mean <- mean(df_sample)
  sample_means_n5 <- c(sample_means_n5, df_sample_mean)
}

hist(sample_means_n5,
     main = "Sample Means (n=5)",
     xlab = "Average Sales",
     ylab = "Density",
     freq = FALSE,
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(sample_means_n5), sd = sd(sample_means_n5)),
      add = TRUE, col = "red", lwd = 2)

sample_means_n15 <- c()

for (i in 1:num_of_samples_to_take) {
  df_sample <- sample(population_sales, 15, replace = TRUE)
  df_sample_mean <- mean(df_sample)
  sample_means_n15 <- c(sample_means_n15, df_sample_mean)
}

hist(sample_means_n15,
     main = "Sample Means (n=15)",
     xlab = "Average Sales",
     ylab = "Density",
     freq = FALSE,
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(sample_means_n15), sd = sd(sample_means_n15)),
      add = TRUE, col = "red", lwd = 2)

sample_means_n50 <- c()

for (i in 1:num_of_samples_to_take) {
  df_sample <- sample(population_sales, 50, replace = TRUE)
  df_sample_mean <- mean(df_sample)
  sample_means_n50 <- c(sample_means_n50, df_sample_mean)
}

hist(sample_means_n50,
     main = "Sample Means (n=50)",
     xlab = "Average Sales",
     ylab = "Density",
     freq = FALSE,
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(sample_means_n50), sd = sd(sample_means_n50)),
      add = TRUE, col = "red", lwd = 2)

par(mfrow = c(1, 1))
