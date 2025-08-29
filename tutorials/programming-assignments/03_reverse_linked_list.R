# RECURSION 03: Reverse a linked list [COMPLETE]

create_llnode <- function(data, next_node = NULL) {
  list(data = data, next_ptr = next_node)
}

linked_list <- function(values) {
  if (length(values) == 0) {
    return(NULL)
  }
  create_llnode(values[1], next_node = linked_list(values[-1]))
}

print_list <- function(head) {
  if (is.null(head)) {
    cat("NULL\n")
    return()
  }
  
  current <- head
  elements <- c()
  while (!is.null(current)) {
    elements <- c(elements, current$data)
    current <- current$next_ptr
  }
  cat(paste(elements, collapse=" -> "), "-> NULL\n")
}

reverse_helper <- function(current, previous = NULL) {
  if (is.null(current)) {
    return(previous)
  }
  next_node <- current$next_ptr
  current$next_ptr <- previous
  reverse_helper(next_node, current)
}

reverse_linked_list <- function(head) {
  reverse_helper(head)
}

original_values <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
linked_list_01 <- linked_list(original_values)

cat("Original: ")
print_list(linked_list_01)

reversed_list_01 <- reverse_linked_list(linked_list_01)

cat("Reversed: ")
print_list(reversed_list_01)