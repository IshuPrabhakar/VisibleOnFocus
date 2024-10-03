import 'package:flutter/material.dart';
import 'package:visible_on_focus/visible_on_focus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visible On Focus Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Visible On Focus Example'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 700), // Spacer to demonstrate scrolling
        VisibleOnFocus(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter Text',
              hintText: 'Focus here to scroll',
            ),
          ),
        ),
        SizedBox(height: 300), // More content to demonstrate scrolling
      ],
    );
  }
}
