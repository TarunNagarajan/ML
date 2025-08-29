# RECURSION 05: Reverse a Queue [COMPLETE]

create_queue <- function() {
  q_env <- new.env(parent = emptyenv())
  q_env$items <- list()
  q_env
}

enqueue <- function(q_env, value) {
  q_env$items <- append(q_env$items, list(value))
}

dequeue <- function(q_env) {
  if (length(q_env$items) == 0) {
    stop("Queue is already empty, so we cannot dequeue from it.")
  }
  value <- q_env$items[[1]]
  q_env$items <- q_env$items[-1]
  return(value)
}

is_empty <- function(q_env) {
  length(q_env$items) == 0
}

print_queue <- function(q_env, name = "Queue") {
  cat(paste0(name, ": Front -> "))
  if (!is_empty(q_env)) {
    # fixed: found out about this unlist thing
    cat(paste(unlist(q_env$items), collapse = " -> "))
  }
  cat(" -> Rear\n")
}

reverse_queue <- function(q) {
  if (is_empty(q)) {
    return()
  }
  
  item <- dequeue(q)
  reverse_queue(q)
  enqueue(q, item)
}

queue <- create_queue()
enqueue(queue, 10)
enqueue(queue, 20)
enqueue(queue, 30)
enqueue(queue, 40)
enqueue(queue, 50)

print_queue(queue, "Original Queue")

reverse_queue(queue)
print_queue(queue, "Reversed Queue")
