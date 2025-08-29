# RECURSION 01: Palindrome String Check [COMPLETE]

check_palindrome <- function(s) {
  len <- nchar(s)
  
  if (len <= 1) {
    return(TRUE)
  }
  
  first_char <- substr(s, 1, 1)
  last_char <- substr(s, len, len)
  
  if (first_char != last_char) {
    return(FALSE)
  }
  
  substring <- substr(s, 2, len - 1)
  return(check_palindrome(substring))
}

is_palindrome <- function(input_string) {
  cleaned_string <- tolower(input_string)
  return(check_palindrome(cleaned_string))
}


test_strings <- c("malayalam", "racecar", "statistics")

for (s in test_strings) {
  if (is_palindrome(s)) {
    cat(sprintf('"%s" is a palindrome.\n', s))
  } else {
    cat(sprintf('"%s" is NOT a palindrome.\n', s))
  }
}

