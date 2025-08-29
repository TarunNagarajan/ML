# FUNCTIONS 02 [COMPLETE]
# recursive version

recursion <- function(integer, count) {
  if (integer == 1) {
    return (count)
  }
  
  if (integer %% 2 == 1) {
    return (recursion(3 * integer + 1, count + 1));
  } 
  
  else {
    return (recursion(integer / 2, count + 1));
  }
}

sample_integer <- 34
count <- recursion(sample_integer, 0);
cat("Total Function Calls:", count)
