import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
  This widget draws a custom icon from a svg 
  It receives the icon name and color as parameters.
  It can also receive an $active parameter to indentify if
  the icon is has active status (usefull for routes or tabs)

  By defualt $active is set to false.
  Is $color is passed, the $active parameter will be ignored.

  The icons are located at ./lib/assets/svg

  @param String icon
  @param Color color

*/

class SVGIcon extends StatelessWidget {
  final String icon;
  final Color color;
  final bool active;
  SVGIcon({this.icon, this.color, this.active = false});

  final String path = "./lib/assets/svg";

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // path to the svg icon
      '$path/$icon.svg',
      // if a color is passed
      color: color != null
          // set color passed from parent
          ? color
          // otherwise if active is set
          : active
              // set icon color with the primary color
              ? AppStyles.primaryColor
              // otherwise set it with opaque color
              : AppStyles.bodyColor.withOpacity(0.5),
      matchTextDirection: true,
    );
  }
}
