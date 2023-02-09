import 'package:flutter/material.dart';
import '../model/tree_node.dart';

class TreeModel with ChangeNotifier {
  TreeNode _root;
  TreeNode get root => _root;

  void insert(int value) {
    _root = _insert(_root, value);
    notifyListeners();
  }

  TreeNode _insert(TreeNode root, int value) {
    if (root == null) {
      return TreeNode(value: value);
    }

    if (value < root.value) {
      root.left = _insert(root.left, value);
      root.hasLeftChild = true;
    } else if (value == root.value) {
    } else {
      root.right = _insert(root.right, value);
      root.hasRightChild = true;
    }
    return root;
  }
}
