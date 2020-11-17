import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_styles.dart';

class Heading extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final bool isPrimary;
  final int heading;

  const Heading({
    this.text,
    this.weight,
    this.isPrimary: true,
    this.heading,
  });

  @override
  Widget build(BuildContext context) {
    var fontSize = 18.0;

    switch (heading) {
      case 1:
        fontSize = 34.0;
        break;
      case 2:
        fontSize = 30.0;
        break;
      case 3:
        fontSize = 28.0;
        break;
      case 4:
        fontSize = 26.0;
        break;
    }

    return Text(
      text,
      style: GoogleFonts.alegreyaSansSc(
        fontWeight: weight,
        fontSize: fontSize,
        color: isPrimary ? AppStyles.primaryColor : AppStyles.bodyColor,
        letterSpacing: -0.8,
      ),
    );
  }
}

class TEXT extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final bool isPrimary;

  const TEXT({
    this.text,
    this.weight,
    this.isPrimary: false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        fontWeight: weight,
        fontSize: 16,
        color: isPrimary ? AppStyles.primaryColor : AppStyles.bodyColor,
      ),
    );
  }
}
