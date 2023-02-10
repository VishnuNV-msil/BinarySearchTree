import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/tree.dart';
import './widgets/treeView.dart';

class TreePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final treeModel = Provider.of<TreeModel>(context);
    //print('rebuild main');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binary Search Tree'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              //height: 100,
              padding: const EdgeInsets.all(10),
              child: TextField(
                onSubmitted: (value) {
                  treeModel.insert(int.parse(_controller.text));
                _controller.clear();
                },
                controller: _controller,
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              child: const Text('Insert'),
              onPressed: () {
                treeModel.insert(int.parse(_controller.text));
                _controller.clear();
              },
            ),
            TreeView()
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TreeModel(),
      child: MaterialApp(
        home: TreePage(),
      ),
    ),
  );
}
