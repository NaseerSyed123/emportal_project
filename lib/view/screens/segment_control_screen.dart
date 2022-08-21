import 'package:flutter/material.dart';
import 'dart:math';
import 'package:material_segmented_control/material_segmented_control.dart';

class SegmentControlScreen extends StatefulWidget {


  @override
  State<SegmentControlScreen> createState() => _SegmentControlScreenState();
}

class _SegmentControlScreenState extends State<SegmentControlScreen> {
  int _currentSelection = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: Colors.redAccent,
              unselectedColor: Colors.white,
              borderRadius: 6.0,
              disabledChildren: _disabledIndices,
              verticalOffset: 8.0,
              onSegmentChosen: (index) {
                setState(() {
                  _currentSelection = _currentSelection;
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Toggle disabled'),
                  onPressed: () {
                    // This is just an example on how disabled children work.
                    // A disabled index is determined randomly.
                    setState(() {
                      _disabledIndices.clear();
                      _disabledIndices.add(_randomInt());
                    });
                  },
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  child: Text('Un-select all'),
                  onPressed: () => setState(() => _currentSelection = _currentSelection),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Map<int, Widget> _children = {
    0: Text('Flutter'),
    1: Text('Dart'),
    2: Text('Desktop'),
    3: Text('Mobile'),
    4: Text('Web')
  };

  // Holds all indices of children to be disabled.
  // Set this list either null or empty to have no children disabled.
  List<int> _disabledIndices = [];

  int _randomInt() {
    return Random.secure().nextInt(_children.length);
  }
}
