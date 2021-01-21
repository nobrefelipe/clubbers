import 'package:clubbers/app/shared/components/logo.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      floating: true,
      title: Logo(),
      actions: [
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
          child: IconButton(
            icon: Icon(
              Ionicons.ios_search,
              size: 22,
              color: AppStyles.bodyColor,
            ),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }
}
