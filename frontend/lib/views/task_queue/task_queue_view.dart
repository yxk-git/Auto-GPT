import 'package:flutter/material.dart';
import 'package:auto_gpt_flutter_client/viewmodels/skill_tree_viewmodel.dart';
import 'package:provider/provider.dart';

// TODO: Add view model for task queue instead of skill tree view model
class TaskQueueView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SkillTreeViewModel>(context);

    // Reverse the node hierarchy
    final reversedHierarchy =
        viewModel.selectedNodeHierarchy?.reversed.toList() ?? [];

    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          // The list of tasks (tiles)
          ListView.builder(
            itemCount: reversedHierarchy.length,
            itemBuilder: (context, index) {
              final node = reversedHierarchy[index];
              return Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                decoration: BoxDecoration(
                  color: Colors.white, // white background
                  border: Border.all(
                      color: Colors.black, width: 1), // thin black border
                  borderRadius: BorderRadius.circular(4), // small corner radius
                ),
                child: ListTile(
                  title: Center(child: Text('Node ID: ${node.id}')),
                  subtitle: Center(child: Text('Color: ${node.color}')),
                ),
              );
            },
          ),

          // Checkmark button at the bottom right
          Positioned(
            bottom: 50,
            right: 50,
            child: Tooltip(
              message: 'Run suite of tests',
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic here to run the suite of tests
                },
                child: Icon(Icons.check, color: Colors.green),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(
                      BorderSide(color: Colors.green, width: 3)),
                  minimumSize:
                      MaterialStateProperty.all(Size(50, 50)), // Square size
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
