import 'package:flutter/material.dart';
import '../model/tree_node.dart';

class TreeModel with ChangeNotifier {
  TreeNode _root;
  TreeNode current_root;
  TreeNode get root => _root;

  void insert(int value) {
   // print('object');
    _root = _insert(_root, value);
    //print('root is : ${_root.value}');
    current_root ??= root; 
    //print('current root first is : ${current_root.value}');
    notifyListeners();
  }

  TreeNode _insert(TreeNode root, int value) {
    if (root == null) {
      return TreeNode(value: value);
    }
    current_root = root;
    //print('current root first is : ${current_root.value}');

    // if (current_root.left != null) {
    //   print('current root.left is : ${current_root.left.value}');
    // }

    // if (current_root.right != null) {
    //   print('current root.right is : ${current_root.right.value}');
    // }

    if (value < root.value) {
      root.left = _insert(root.left, value);
     // print('left is : ${root.left.value}');
    } else if (value == root.value) {
    } else {
      root.right = _insert(root.right, value);
      //print('right is : ${root.right.value}');
    }

   // print('current root is : ${current_root.value}');
    

    return root;
  }
}
