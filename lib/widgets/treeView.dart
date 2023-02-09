import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/tree.dart';
import '../model/tree_node.dart';

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
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  treenode.root == node ? Container( 
                  ) : Transform.rotate(
                    angle: level > 1 ? ((treenode.current_root.value > node.value)  ? 2.2 : 0.7) : ((treenode.root.value > node.value)  ? 2.2 : 0.7),
                    //angle: (node.)  ? 2.2 : 0.7,
                    child: const Icon(Icons.arrow_right_alt,
                          color: Colors.black,
                          size: 50,
                          ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //decoration: BoxDecoration(
                       // border: Border.all(color: Colors.black, width: 1)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    // width: level == 0 ? 100 : (100 / level),
                    child: _buildTree(node.left, level + 1),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    //decoration: BoxDecoration(
                       // border: Border.all(color: Colors.green, width: 1)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    // width:level == 0 ? 100 : (100 / level),
                    child: _buildTree(node.right, level + 1),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final treeModel = Provider.of<TreeModel>(context);
    // return treeModel.root == null ? Container() : _buildTree(treeModel.root, 0);
    return _buildTree(treeModel.root, 0);
  }
}
