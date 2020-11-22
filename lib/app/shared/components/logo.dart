import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeadingComfortaa(
          text: "club",
          heading: 6,
          weight: FontWeight.bold,
        ),
        HeadingComfortaa(
          text: "bers",
          heading: 6,
          isPrimary: false,
          weight: FontWeight.bold,
        ),
      ],
    );
  }
}
