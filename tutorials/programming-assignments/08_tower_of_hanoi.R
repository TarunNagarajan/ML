# FUNCTIONS 08 [COMPLETE]
# recursive equation for the TOWER OF HANOI problem

hanoi <- function(rings, start, end, intermediate) {
  if (rings == 0) {
    return()
  } 
  hanoi(rings - 1, start, intermediate, end)
  cat("MOVE RING NO.", rings, "FROM", start, "TO", end, "\n")
  hanoi(rings - 1, intermediate, end, start)
}

hanoi(100, "START", "END", "INTERMEDIATE")
