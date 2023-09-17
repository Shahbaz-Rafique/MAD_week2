import 'package:flutter/material.dart';

void main() {
  runApp(Task2());
}

class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  String reversedString = '';

  void reverseWords() {
    String input = textEditingController.text;
    List<String> words = input.split(' ');
    List<String> reversedWords = List.from(words.reversed);
    setState(() {
      reversedString = reversedWords.join(' ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Reversal App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: 'Enter a long string with multiple words',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                reverseWords();
              },
              child: Text('Reverse Words'),
            ),
            SizedBox(height: 20),
            Text(
              'Reversed String:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              reversedString,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
