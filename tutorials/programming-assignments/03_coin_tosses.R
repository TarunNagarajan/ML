# FUNCTIONS 03 [COMPLETE]
# simulate coin tosses over 100 samples with the flip() function
# should print head or tails -> every toss

flip <- function() {
  if (runif(1, 0, 1) < 0.5) {
    # TAILS: 0
    return(0)
  } else {
    # HEADS: 1
    return(1)
  }
}

heads_count <- 0
tails_count <- 0

for (i in (1:100)) {
  if (flip() == 1) {
    heads_count <- heads_count + 1
  } else {
    tails_count <- tails_count + 1
  }
}

cat("TAILS:", tails_count);
cat("HEADS:", heads_count);

