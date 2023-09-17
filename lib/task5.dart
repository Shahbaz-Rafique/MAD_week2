import 'package:flutter/material.dart';

void main() {
  runApp(Task5());
}

List<T> removeDuplicates<T>(List<T> inputList) {
  List<T> result = [];
  
  for (T item in inputList) {
    if (!result.contains(item)) {
      result.add(item);
    }
  }
  
  return result;
}

class Task5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> originalList = [1, 2, 2, 3, 4, 4, 5];
    List<int> uniqueList = removeDuplicates(originalList);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Remove Duplicates Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Original List: $originalList'),
              Text('Unique List: $uniqueList'),
            ],
          ),
        ),
      ),
    );
  }
}
