import 'dart:math';
import 'dart:core';
import 'package:flutter/material.dart';

void main() {
  runApp(Task3());
}

class Task3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswordGenerator(),
    );
  }
}

class PasswordGenerator extends StatefulWidget {
  @override
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String generatedPassword = '';

  String generateWeakPassword() {
    // List of weak password options
    final List<String> weakPasswords = ['password', '123456', 'letmein', 'qwerty', 'admin'];

    // Select a random weak password
    final random = Random();
    return weakPasswords[random.nextInt(weakPasswords.length)];
  }

  String generateStrongPassword() {
    // Define character sets for strong password
    final lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz';
    final upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers = '0123456789';
    final symbols = '!@#\$%^&*()_+{}[]|:;<>,.?/~';

    final allCharacters = lowerCaseLetters + upperCaseLetters + numbers + symbols;
    final random = Random();

    // Generate a strong password with a length of 12 characters
    final passwordLength = 12;
    return List.generate(
        passwordLength, (index) => allCharacters[random.nextInt(allCharacters.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generatedPassword = generateWeakPassword();
                });
              },
              child: Text('Generate Weak Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generatedPassword = generateStrongPassword();
                });
              },
              child: Text('Generate Strong Password'),
            ),
            SizedBox(height: 20),
            Text(
              'Generated Password:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              generatedPassword,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
