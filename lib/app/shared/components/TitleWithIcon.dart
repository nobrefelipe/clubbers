import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/*
  TITLE WITH ICON COMPONENT
  This component draws a title with an icon 
  placed on its left side.

  We can set a custom icon by passing the name of the icon
  located in /assets/svg/. Using SVGIcon component
  
  If customIcon is set we use it, otherwise we 
  get the icon the parameter

  @param icon
  @param title
  @param customIcon

*/

class TitleWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final String customIcon;

  const TitleWithIcon({this.icon, this.title, this.customIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customIcon != null
            ? SVGIcon(
                icon: customIcon,
                active: true,
                scale: 1.15,
              )
            : Icon(
                icon,
                color: AppStyles.primaryColor,
                size: 18.0,
              ),
        VerticalDivider(width: 4),
        Heading(
          text: title,
          weight: FontWeight.bold,
          heading: 5,
          isPrimary: false,
        )
      ],
    );
  }
}
