import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/*
  TITLE WITH ICON COMPONENT
  This component draws a title with an icon 
  placed on its left side

  @param icon
  @param title

*/

class TitleWithIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  const TitleWithIcon({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
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
