# FUNCTIONS 04 [COMPLETE]
# 24 HR TO 12 HR Conversion

# I: Input Function
input <- function(hours, minutes) {
  ampm <- if (hours < 12) 'A' else 'P'
  conversion(hours, minutes, ampm)
}

# II: Conversion Function
conversion <- function(hours, minutes, ampm) {
  out_hours <- hours
  if (hours == 0) {
    out_hours <- 12
    ampm <- 'A'
  } else if (hours == 12) {
    out_hours <- 12
    ampm <- 'P'
  } else if (hours > 12) {
    out_hours <- hours - 12
    ampm <- 'P'
  } else {
    out_hours <- hours
    ampm <- 'A'
  }
  output(out_hours, minutes, ampm)
}

# III: Output Function
output <- function(hours, minutes, ampm) {
  ampm_output <- if (ampm == 'A') "AM" else "PM"
  cat(sprintf("%d:%02d%s\n", hours, minutes, ampm_output))
}

input(17, 45)

