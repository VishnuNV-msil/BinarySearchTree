import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import '../provider/tree.dart';
import '../model/tree_node.dart';
import 'circular_Container.dart';

class TreeView extends StatelessWidget {
  Widget _buildTree(TreeNode node, int level) {
    if (node == null) {
      return Container();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<TreeModel>(builder: (context, treenode, child) {
          return PlayAnimationBuilder<double>(
            duration: const Duration(seconds: 4),
            tween: Tween(begin: 0, end: 1),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    circularcontainer(node, level),
                    Row(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 8),
                          child: _buildTree(node.left, level + 1),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 8),
                          child: _buildTree(node.right, level + 1),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final treeModel = Provider.of<TreeModel>(context);
    return _buildTree(treeModel.root, 0);
  }
}
