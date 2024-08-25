# Truncated

`Truncated` is a simple Flutter widget that truncates long text and appends an ellipsis or any custom suffix. It supports expanding the text with a tap and provides smooth animation for opening and closing the text.

## Features

- Truncates text after a maximum length or a maximum number of lines.
- Supports a custom suffix for truncated text.
- Allows expanding the text with a tap to see the full content.
- Smooth animation for expanding and collapsing text.
- Custom styles for truncated and expanded text.

## Installation

Add `truncated` to your `pubspec.yaml` file:

```yaml
dependencies:
  truncated: ^0.0.2 # Replace with the latest version
```

## You can use
- Create a simple program dart : example.dart, and copied this code :

```dart
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
        appBar: AppBar(title: const Text('Truncated Example')),
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
```

## Configuration Options
+ text: The text to display
+ maxLength: Maximum length of characters before truncation
+ maxLines: Maximum number of lines before truncation.
+ style: Style for the truncated text
+ expandedStyle: Style for the expanded text
+ truncationSuffix: Suffix to append when text is truncated (default is '...')
+ expandable: Whether the text can be expanded by tapping (default is true)
+ initiallyExpanded: Whether the text is initially expanded (default is false)
+ animationDuration: Duration of the expand/collapse animation (default is const Duration(milliseconds: 200))

## 0.0.2
- Factoring
- Update Readme

## Contributing

Contributions are welcome! Please open an issue or a pull request for any improvements or fixes.

## License
This project is licensed under the MIT Licensea
