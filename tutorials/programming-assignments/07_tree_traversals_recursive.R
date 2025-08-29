# RECURSION 07: Tree Traversals [COMPLETE]

create_tree_node <- function(value, left = NULL, right = NULL) {
  node <- new.env(parent = emptyenv())
  node$value <- value
  node$left <- left
  node$right <- right
  return(node)
}

preorder <- function(node) {
  if (is.null(node)) return()
  cat(node$value, " ")
  preorder(node$left)
  preorder(node$right)
}

inorder <- function(node) {
  if (is.null(node)) return()
  inorder(node$left)
  cat(node$value, " ")
  inorder(node$right)
}

postorder <- function(node) {
  if (is.null(node)) return()
  postorder(node$left)
  postorder(node$right)
  cat(node$value, " ")
}

tree_root <- create_tree_node(1,left = create_tree_node(2,
                                                      left = create_tree_node(4),
                                                      right = create_tree_node(5)
                              ),
                              right = create_tree_node(3)
)

cat("Preorder Traversal (Root-Left-Right):\n")

preorder(tree_root)
cat("\n\n")

cat("Inorder Traversal (Left-Root-Right):\n")
inorder(tree_root)
cat("\n\n")

cat("Postorder Traversal (Left-Right-Root):\n")
postorder(tree_root)
cat("\n")