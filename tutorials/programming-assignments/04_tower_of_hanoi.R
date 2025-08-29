# RECURSION 04: Tower of Hanoi [COMPLETE]

hanoi <- function(rings, start, end, intermediate) {
  if (rings == 0) {
    return()
  } 
  hanoi(rings - 1, start, intermediate, end)
  cat("MOVE RING NO.", rings, "FROM", start, "TO", end, "\n")
  hanoi(rings - 1, intermediate, end, start)
}

hanoi(10, "START", "END", "INTERMEDIATE")
