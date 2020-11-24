import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatelessWidget {
  final String pageTitle;
  final bool showback;

  const CustomAppBar({this.pageTitle, this.showback = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, -15.0),
            blurRadius: 20.0,
          )
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Heading(
          text: pageTitle,
          isPrimary: true,
          heading: 5,
          weight: FontWeight.bold,
        ),
        leading: showback
            ? IconButton(
                icon: Icon(
                  Ionicons.ios_arrow_round_back,
                  size: 32,
                  color: AppStyles.bodyColor,
                ),
                onPressed: () => Modular.to.pop(),
              )
            : null,
      ),
    );
  }
}
