import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';

/*
  RICH TITLE COMPONENT
  This component provides a multi text functionality
  when we need to have a opaque heading with a bold value

  I receives 3 parameters:

  @param title
  @param value
  @param alignment

*/

class RichTitle extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment alignment;

  const RichTitle({
    this.title,
    this.value,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Opacity(
          opacity: 0.6,
          child: TEXT(
            text: title,
            weight: FontWeight.normal,
            noMargin: true,
            size: 12,
          ),
        ),
        TEXT(
          text: value,
          weight: FontWeight.bold,
          size: 16.0,
        ),
      ],
    );
  }
}
