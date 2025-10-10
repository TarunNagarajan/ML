df_raw <- read.csv("datasets\\StudentsPerformance.csv")

total_score_with_na <- df_raw$math.score + df_raw$reading.score + df_raw$writing.score
total_score <- total_score_with_na[!is.na(total_score_with_na)]

par(mfrow = c(2, 2))
hist(total_score,
     main = "Original Distribution of Scores",
     xlab = "Scores",
     ylab = "Density",
     freq = FALSE,
     col = "skyblue",
     border = "white")

lines(density(total_score), col = "red", lwd = 2)

num_of_samples_to_take <- 1000

sample_means_n5 <- c()

for (i in 1:num_of_samples_to_take) {
  df_sample <- sample(total_score, 5, replace = TRUE)
  df_sample_mean <- mean(df_sample)
  sample_means_n5 <- c(sample_means_n5, df_sample_mean)
}

hist(sample_means_n5,
     main = "Sample Means (n=5)",
     xlab = "Average Score",
     ylab = "Density",
     freq = FALSE,
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(sample_means_n5), sd = sd(sample_means_n5)),
      add = TRUE, col = "red", lwd = 2)

sample_means_n20 <- c()

for (i in 1:num_of_samples_to_take) {
  df_sample <- sample(total_score, 20, replace = TRUE)
  df_sample_mean <- mean(df_sample)
  sample_means_n20 <- c(sample_means_n20, df_sample_mean)
}

hist(sample_means_n20,
     main = "Sample Means (n=20)",
     xlab = "Average Score",
     ylab = "Density",
     freq = FALSE,
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(sample_means_n20), sd = sd(sample_means_n20)),
      add = TRUE, col = "red", lwd = 2)

sample_means_n50 <- c()

for (i in 1:num_of_samples_to_take) {
  df_sample <- sample(total_score, 50, replace = TRUE)
  df_sample_mean <- mean(df_sample)
  sample_means_n50 <- c(sample_means_n50, df_sample_mean)
}

hist(sample_means_n50,
     main = "Sample Means (n=50)",
     xlab = "Average Score",
     ylab = "Density",
     freq = FALSE,
     col = "lightgreen",
     border = "white")
curve(dnorm(x, mean = mean(sample_means_n50), sd = sd(sample_means_n50)),
      add = TRUE, col = "red", lwd = 2)

par(mfrow = c(1, 1))
