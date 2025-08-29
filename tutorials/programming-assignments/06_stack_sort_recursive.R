# RECURSION 06: Sort a stack, recursively [COMPLETE]

create_stack <- function() {
  stack_env <- new.env(parent = emptyenv())
  stack_env$items <- list()
  stack_env
}

push <- function(stack, value) {
  stack$items <- append(stack$items, list(value), after = 0)
}

pop <- function(stack) {
  if (length(stack$items) == 0) {
    stop("The stack is already empty, so we cannot pop from it.")
  }
  value <- stack$items[[1]]
  stack$items <- stack$items[-1]
  return(value)
}

peek <- function(stack) {
  if (length(stack$items) == 0) {
    return(NULL)
  }
  return(stack$items[[1]])
}

is_empty <- function(stack) {
  length(stack$items) == 0
}

print_stack_elements <- function(stack, name = "Stack") {
  cat(paste0(name, ": Top -> "))
  if (!is_empty(stack)) {
    cat(paste(unlist(stack$items), collapse = " -> "))
  }
  cat(" -> Bottom\n")
}

insert_sorted <- function(stack, item) {
  if (is_empty(stack) || item > peek(stack)) {
    push(stack, item)
  } else {
    temp <- pop(stack)
    insert_sorted(stack, item)
    push(stack, temp)
  }
}

sort_stack <- function(stack) {
  if (!is_empty(stack)) {
    temp <- pop(stack)
    sort_stack(stack)
    insert_sorted(stack, temp)
  }
}

stack <- create_stack()
push(stack, 5)
push(stack, 1)
push(stack, 9)
push(stack, 3)
push(stack, 6)

print_stack_elements(stack, "Original Stack")
sort_stack(stack)
print_stack_elements(stack, "Sorted Stack")