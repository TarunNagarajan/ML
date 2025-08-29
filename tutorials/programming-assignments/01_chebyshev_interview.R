# CHEBYSHEV 01: Interview Prediction [COMPLETE]

mean <- 60
stdev <- 6
total_candidates <- 1000
selected_candidates <- 70

# the ratio of applicants that would actually get a job
selected_ratio <- selected_candidates / total_candidates

# CHEBYSHEV'S INEQUALITY
# states that the proportion of data within k standard deviations within the mean is:
# 1 - 1/k^2

applicant_score <- 84
# I: n(standard deviations of the score from the mean)
stdev_count <- (applicant_score - mean) / stdev

# II: evaluate bounds
lower_bound <- mean - (stdev_count * stdev)
upper_bound <- mean + (stdev_count * stdev)
cat("Lower Bound:", lower_bound, "\n")
cat("Upper Bound:", upper_bound, "\n")

# III: chebyshev proportion
within_proportion = 1 - 1/stdev_count^2
cat("Proportion Limit:", within_proportion, "\n")

cat("Outside the Proportion Range:", 1 - within_proportion, "\n")
cat("\n")
if (((total_candidates * (1 - within_proportion)) < selected_candidates) && (applicant_score > mean)) {
  cat("The candidate with score", applicant_score, "will be selected.\n")
  cat("The count of candidates above score", mean, "is approximately", (total_candidates * (1 - within_proportion)), "which is lower than the number of candidates to be selected:", selected_candidates, "\n")
} else {
  cat("The candidate with score", applicant_score, "will be rejected.")
}





