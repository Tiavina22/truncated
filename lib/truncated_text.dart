library truncated_text;

import 'package:flutter/material.dart';

/// A widget that truncates text based on a maximum character length or maximum lines.
/// It supports optional expansion with a tap, custom styling, and animations.
class TruncatedText extends StatefulWidget {
  final String text; // The text to display.
  final int maxLength; // Maximum length of characters before truncation.
  final int? maxLines; // Maximum number of lines before truncation.
  final TextStyle? style; // Style for the truncated text.
  final TextStyle? expandedStyle; // Style for the expanded text.
  final String truncationSuffix; // Suffix to append when text is truncated.
  final bool expandable; // Whether the text can be expanded by tapping.
  final bool initiallyExpanded; // Whether the text is initially expanded.
  final Duration
      animationDuration; // Duration of the expand/collapse animation.

  const TruncatedText(
    this.text, {
    Key? key,
    required this.maxLength,
    this.maxLines,
    this.style,
    this.expandedStyle,
    this.truncationSuffix = '...',
    this.expandable = true,
    this.initiallyExpanded = false,
    this.animationDuration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  _TruncatedTextState createState() => _TruncatedTextState();
}

class _TruncatedTextState extends State<TruncatedText>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false; // Tracks whether the text is expanded or truncated.

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate whether the text exceeds the max length or lines.
        bool isTruncated = widget.text.length > widget.maxLength;

        // Determine the text to display based on the expansion state.
        String displayText = !_isExpanded && isTruncated
            ? widget.text.substring(0, widget.maxLength) +
                widget.truncationSuffix
            : widget.text;

        return GestureDetector(
          onTap: widget.expandable
              ? () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                }
              : null,
          child: AnimatedSize(
            duration: widget.animationDuration,
            curve: Curves.easeInOut,
            child: Text(
              displayText,
              style: _isExpanded
                  ? widget.expandedStyle ?? widget.style
                  : widget.style ??
                      const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
              maxLines: _isExpanded
                  ? null
                  : widget.maxLines ?? 1, // Set maxLines based on state.
              overflow:
                  _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
