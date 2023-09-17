import 'package:flutter/material.dart';

void main() {
  runApp(const Task1());
}

class Task1 extends StatelessWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FibonacciGenerator(),
    );
  }
}

class FibonacciGenerator extends StatefulWidget {
  const FibonacciGenerator({Key? key}) : super(key: key);

  @override
  _FibonacciGeneratorState createState() => _FibonacciGeneratorState();
}

class _FibonacciGeneratorState extends State<FibonacciGenerator> {
  int _numToGenerate = 0;
  List<int> _fibonacciNumbers = [];

  void _generateFibonacciNumbers() {
    if (_numToGenerate <= 0) {
      return;
    }

    int a = 0, b = 1;
    _fibonacciNumbers = [a, b];

    while (_fibonacciNumbers.length < _numToGenerate) {
      int next = a + b;
      _fibonacciNumbers.add(next);
      a = b;
      b = next;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fibonacci Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter the number of Fibonacci numbers to generate:'),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numToGenerate = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generateFibonacciNumbers,
              child: Text('Generate'),
            ),
            SizedBox(height: 20),
            Text('Generated Fibonacci Numbers:'),
            SizedBox(height: 10),
            Text(_fibonacciNumbers.join(', ')),
          ],
        ),
      ),
    );
  }
}