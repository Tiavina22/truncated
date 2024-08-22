import 'package:flutter/material.dart';
import 'package:truncated/truncated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Truncated Text Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: TruncatedText(
            'This is a very long text that should be truncated. You can tap to expand and see the full content!',
            maxLength: 50,
            maxLines: 2, // Truncate after two lines.
            truncationSuffix: '... See more',
            expandable: true,
            initiallyExpanded: false,
            animationDuration: Duration(milliseconds: 300),
          ),
        ),
      ),
    );
  }
}
