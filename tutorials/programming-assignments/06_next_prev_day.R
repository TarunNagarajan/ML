library(r2r)
day_count <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)

is_leap_year <- function(year) {
  (year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)
}

next_day <- function(day, month, year) {
  # EDGE CASES
  if (month == 2 && is_leap_year(year)) {
    if (day < 29) {
      return (c(day + 1, month, year))
    } else if (day == 29) {
      return (c(1, 3, year))
    }
  }
  
  if (month == 2 && !is_leap_year(year)) {
    if (day < 28) {
      return (c(day + 1, month, year))
    } else if (day == 28) {
      return (c(1, 3, year))
    }
  }
  
  if (day_count[month] == 31) {
    if (day < 31) {
      return (c(day + 1, month, year))
    } else if (day == 31) {
      if (month == 12) {
        # EDGE CASE: new year
        return (c(1, 1, year + 1))
      } else {
        return (c(1, month + 1, year))
      }
    }
  }
  
  if (day_count[month] == 30) {
    if (day < 30) {
      return (c(day + 1, month, year))
    } else if (day == 30) {
      return (c(1, month + 1, year))
    }
  }
  return(NA)
}

prev_day <- function(day, month, year) {
  # EDGE CASES:
  if (month == 3 && day == 1 && is_leap_year(year)) {
    return (c(29, 2, year))
  }
  if (month == 3 && day == 1 && !is_leap_year(year)) {
    return (c(28, 2, year))
  }
  
  if (month == 1 && day == 1) {
    return (c(31, 12, year - 1))
  }
  
  if (day == 1) {
    prev_month <- month - 1
    prev_month_days <- if (prev_month == 2 && is_leap_year(year)) 29 else day_count[prev_month]
    return (c( prev_month_days, prev_month, year))
  }
  if (day > 1) {
    return (c(day - 1, month, year))
  }
  return(NA)
}

next_day_result <- next_day(31, 12, 2020) 
prev_day_result <- prev_day(1, 3, 2020)   

cat("NEXT DAY:", next_day_result[1], "/", next_day_result[2], "/", next_day_result[3], "\n")
cat("PREVIOUS DAY:", prev_day_result[1], "/", prev_day_result[2], "/", prev_day_result[3], "\n")

