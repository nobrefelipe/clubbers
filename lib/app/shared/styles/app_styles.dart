import 'package:flutter/material.dart';

class AppStyles {
  /*
    COLOUR PALLET
  */
  static const Color primaryColor = Color.fromRGBO(252, 18, 103, 1);
  static const Color secondaryColor = Color.fromRGBO(187, 107, 217, 1);
  static const Color bodyColor = Color.fromRGBO(46, 58, 89, 1);
  static const Color bgColor = Color(0xFFF5F8FD);
  static const Gradient primaryGradient =
      LinearGradient(colors: [secondaryColor, primaryColor]);

  /*
    DEFAULT SPACING
  */
  static const spacing_small = 8.0;
  static const spacing_normal = 16.0;
  static const spacing_big = 24.0;
  static const spacing_extra = 32.0;
  /*
    HORIZONTAL SPACING
  */
  static const EdgeInsets horizintalSpacing =
      EdgeInsets.symmetric(horizontal: spacing_normal);
  static const EdgeInsets horizintalSpacingSmall =
      EdgeInsets.symmetric(horizontal: spacing_small);
  static const EdgeInsets horizintalSpacingBig =
      EdgeInsets.symmetric(horizontal: spacing_big);

  /*
    VERTICAL SPACING
  */
  static const EdgeInsets verticalSpacing =
      EdgeInsets.symmetric(vertical: spacing_normal);
  static const EdgeInsets verticalSpacingSmall =
      EdgeInsets.symmetric(vertical: spacing_small);
  static const EdgeInsets verticalSpacingBig =
      EdgeInsets.symmetric(vertical: spacing_big);

  /*
    HORIZONTAL & VERTICAL SPACING
  */
  static const EdgeInsets spacingNormal = EdgeInsets.all(spacing_normal);
  static const EdgeInsets spacingSmall = EdgeInsets.all(spacing_small);
  static const EdgeInsets spacingBig = EdgeInsets.all(spacing_big);
  static const EdgeInsets spacingExtra = EdgeInsets.all(spacing_extra);

  /*
    BOX SHADOW
  */
  static BoxShadow shadowBoxDecoration = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 0,
    blurRadius: 20,
    offset: Offset(0, 0),
  );

  static BoxShadow shadowBoxDecorationIntense = BoxShadow(
    color: Colors.black.withOpacity(0.4),
    spreadRadius: 0,
    blurRadius: 20,
    offset: Offset(-10, 10),
  );

  static BoxShadow shadowBoxDecorationForButtons = BoxShadow(
    color: Colors.grey.withOpacity(0.8),
    spreadRadius: 0,
    blurRadius: 8,
    offset: Offset(0, 0),
  );

  /*
    BORDER RADIUS
  */
  static BorderRadius borderRadius10 = BorderRadius.all(Radius.circular(10));
  static BorderRadius borderRadius15 = BorderRadius.all(Radius.circular(15));
  static BorderRadius borderRadius20 = BorderRadius.all(Radius.circular(20));
  static BorderRadius borderRadius25 = BorderRadius.all(Radius.circular(25));
}
