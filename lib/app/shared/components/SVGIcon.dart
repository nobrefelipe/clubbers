import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
  This widget draws an custom icon from a svg 
  It receives the icon name and color as parameters.

  The icons are located at ./lib/assets/svg

  @param String icon
  @param Color color

*/

class SVGIcon extends StatelessWidget {
  final String icon;
  final Color color;
  SVGIcon({this.icon, this.color});

  final String path = "./lib/assets/svg";

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      '$path/$icon.svg',
      color: color,
      matchTextDirection: true,
    );
  }
}
