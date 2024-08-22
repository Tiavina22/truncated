import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:truncated/truncated.dart';

void main() {
  testWidgets('TruncatedText widget truncates and expands',
      (WidgetTester tester) async {
    const text =
        'This is a long text that should be truncated and expanded upon tap.';

    // Build the widget.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: TruncatedText(
          text,
          maxLength: 20,
          expandable: true,
          truncationSuffix: '...',
        ),
      ),
    ));

    // Give the tester some time to render the widget.
    await tester.pumpAndSettle();

    // Verify the truncated text.
    expect(find.textContaining('This is a long text'), findsOneWidget);

    // Tap the widget to expand.
    await tester.tap(find.byType(TruncatedText));
    await tester.pumpAndSettle();

    // Verify the full text is shown after expansion.
    expect(find.text(text), findsOneWidget);
  });
}
