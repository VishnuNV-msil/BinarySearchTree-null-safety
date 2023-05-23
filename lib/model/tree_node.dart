class TreeNode {
  int value;
  bool hasLeftChild = false;
  bool hasRightChild = false;
  TreeNode? left;
  TreeNode? right;

  TreeNode({required this.value, this.left, this.right});
}
