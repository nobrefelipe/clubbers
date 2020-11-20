import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_styles.dart';

class Heading extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final bool isPrimary;
  final int heading;
  final double lineheight;

  const Heading({
    this.text,
    this.weight,
    this.isPrimary: true,
    this.heading,
    this.lineheight = 1,
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
      case 5:
        fontSize = 22.0;
        break;
      case 6:
        fontSize = 20.0;
        break;
    }

    return Text(
      text,
      style: GoogleFonts.alegreyaSansSc(
        fontWeight: weight,
        fontSize: fontSize,
        color: isPrimary ? AppStyles.primaryColor : AppStyles.bodyColor,
        letterSpacing: -0.8,
        height: lineheight,
      ),
    );
  }
}

class TEXT extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final bool isPrimary;
  final bool noMargin;
  final double size;
  final TextAlign textAlign;

  const TEXT(
      {this.text,
      this.weight,
      this.isPrimary: false,
      this.noMargin = false,
      this.size = 14,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: !noMargin ? 8.0 : 0.0),
      child: Text(
        text,
        textAlign: textAlign,
        style: GoogleFonts.openSans(
          fontWeight: weight,
          fontSize: size,
          color: isPrimary ? AppStyles.primaryColor : AppStyles.bodyColor,
        ),
      ),
    );
  }
}
