# RECURSION 08: Reverse Doubly Linked List [COMPLETE]

create_dll_node <- function(data, prev_node = NULL, next_node = NULL) {
  node <- new.env(parent = emptyenv())
  node$data <- data
  node$prev_ptr <- prev_node
  node$next_ptr <- next_node
  return(node)
}

create_doubly_linked_list <- function(values) {
  if (length(values) == 0) return(NULL)
  
  head <- create_dll_node(values[1])
  current <- head
  
  for (i in 2:length(values)) {
    new_node <- create_dll_node(values[i], prev_node = current)
    current$next_ptr <- new_node
    current <- new_node
  }
  
  return(head)
}

print_list_forward <- function(head) {
  if (is.null(head)) {
    cat("NULL\n")
    return()
  }
  
  elements <- c()
  current <- head
  while (!is.null(current)) {
    elements <- c(elements, current$data)
    current <- current$next_ptr
  }
  cat(paste(elements, collapse=" <-> "), " -> NULL\n")
}


reverse_dll_recursive <- function(head) {
  if (is.null(head)) {
    return(NULL)
  }
  
  temp_prev <- head$prev_ptr
  head$prev_ptr <- head$next_ptr
  head$next_ptr <- temp_prev
  
  if (is.null(head$prev_ptr)) {
    return(head)
  }
  
  return(reverse_dll_recursive(head$prev_ptr))
}


original_values <- c(10, 20, 30, 40, 50)
my_dll <- create_doubly_linked_list(original_values)

cat("Original list:\n")
print_list_forward(my_dll)

reversed_list_rec <- reverse_dll_recursive(my_dll_restored)
cat("Reversed list (Recursive):\n")
print_list_forward(reversed_list_rec)