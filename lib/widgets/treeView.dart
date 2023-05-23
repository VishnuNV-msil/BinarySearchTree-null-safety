import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import '../provider/tree.dart';
import '../model/tree_node.dart';
import 'circular_Container.dart';
import 'arrow.dart';

class TreeView extends StatelessWidget {
  Widget _buildTree(TreeNode? node, int level) {
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
                    circularcontainer(node),
                    angledArrow(node),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        childContainer(node, level, node.left),
                        const SizedBox(
                          width: 8,
                        ),
                        childContainer(node, level, node.right),
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

   Widget childContainer(TreeNode? node, int level, TreeNode? nodedirection) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: _buildTree(nodedirection, level + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final treeModel = Provider.of<TreeModel>(context);
    return _buildTree(treeModel.root, 0);
  }
}
