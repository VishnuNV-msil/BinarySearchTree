import 'package:flutter/material.dart';
import '../model/tree_node.dart';

Widget angledArrow(TreeNode node) {
  return Row(
    children: <Widget>[
      node.hasLeftChild
          ? Transform.rotate(
              angle: 2.2,
              child: const Icon(
                Icons.arrow_right_alt,
                color: Colors.black,
                size: 50,
              ),
            )
          : Container(),
      node.hasRightChild
          ? Transform.rotate(
              angle: 0.7,
              child: const Icon(
                Icons.arrow_right_alt,
                color: Colors.black,
                size: 50,
              ),
            )
          : Container(),
    ],
  );
}
