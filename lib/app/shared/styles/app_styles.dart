import 'package:flutter/material.dart';

class AppStyles {
  /*
    COLOUR PALLET
  */
  static const Color primaryColor = Color.fromRGBO(252, 18, 103, 1);
  static const Color secondaryColor = Color.fromRGBO(187, 107, 217, 1);
  static const Color bodyColor = Color.fromRGBO(46, 58, 89, 1);

  /*
    HORIZONTAL SPACING
  */
  static const EdgeInsets horizintalSpacing =
      EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizintalSpacingSmall =
      EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizintalSpacingBig =
      EdgeInsets.symmetric(horizontal: 24.0);

  /*
    VERTICAL SPACING
  */
  static const EdgeInsets verticalSpacing =
      EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalSpacingSmall =
      EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets verticalSpacingBig =
      EdgeInsets.symmetric(vertical: 24.0);

  /*
    HORIZONTAL & VERTICAL SPACING
  */
  static const EdgeInsets spacing = EdgeInsets.all(16.0);
  static const EdgeInsets spacingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets spacingBig = EdgeInsets.all(24.0);

  /*
    BOX SHADOW
  */
  static BoxShadow shadowBoxDecoration = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 20,
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
