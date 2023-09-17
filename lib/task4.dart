import 'package:flutter/material.dart';

void main() {
  runApp(Task4());
}

class Task4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First and Last Elements'),
        ),
        body: InputWidget(),
      ),
    );
  }
}

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController inputController = TextEditingController();
  List<int> result = [];

  void calculateResult() {
    List<int> inputList = inputController.text
        .split(',')
        .map((String item) => int.tryParse(item.trim()) ?? 0)
        .toList();
    setState(() {
      result = firstAndLastElements(inputList);
    });
  }

  List<int> firstAndLastElements(List<int> inputList) {
    if (inputList.length >= 2) {
      return [inputList[0], inputList[inputList.length - 1]];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: inputController,
            decoration: InputDecoration(
              labelText: 'Enter numbers (comma-separated)',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: calculateResult,
            child: Text('Calculate'),
          ),
          SizedBox(height: 20),
          Text('Result: ${result.toString()}'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}
