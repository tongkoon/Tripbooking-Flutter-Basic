import 'package:flutter/material.dart';

class Login2Page extends StatefulWidget {
  const Login2Page({super.key});

  @override
  State<Login2Page> createState() => _Login2PageState();
}

class _Login2PageState extends State<Login2Page> {
  String text = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(testPress);
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }

  void testPress() {
    text = 'Tock';
  }
}
