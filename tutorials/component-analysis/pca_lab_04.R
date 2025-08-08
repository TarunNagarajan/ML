rows <- 5

for (i in 0:(rows - 1)) {
  val <- 1
  for (j in 0:i) {
    if (j == 0 || i == 0) {
      val <- 1
    } else {
      val <- val * (i - j + 1) / j
    }
    cat(val, "")
  }
  cat("\n")
}
