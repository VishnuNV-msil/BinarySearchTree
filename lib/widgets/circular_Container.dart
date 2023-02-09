import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tree.dart';
import '../model/tree_node.dart';

Widget circularcontainer(TreeNode node, int level) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
          child: Center(
            child: Text(
              '${node.value}',
              overflow: TextOverflow.visible,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
