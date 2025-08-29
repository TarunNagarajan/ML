# 06: create a list containing numeric vector, character vector, logical vector
# [COMPLETE]

new_list <- list(c(100, 99, 98, 87, 10), c(TRUE, FALSE), c("CSE", "ECE", "MECH"))
n <- length(new_list)

for (i in 1:n) {
  if (class(new_list[[i]]) == "numeric") {
    cat("Numeric Vector:", new_list[[i]], "\n")
  } 
  
  else if (class(new_list[[i]]) == "character") {
    cat("Character Vector: ", new_list[[i]], "\n")
  } 
  
  else if (is.logical(new_list[[i]])) {
    cat("Logical Vector:", new_list[[i]], "\n")
  }
}

