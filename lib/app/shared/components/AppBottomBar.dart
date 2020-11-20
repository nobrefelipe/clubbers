import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:flutter/material.dart';

/*
  BOTTOM NAVIGATION 
*/
class AppBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFFEFF5FF),
      elevation: 25,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 0),
          IconButton(
            icon: SVGIcon(
              icon: 'home',
              active: true,
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: SVGIcon(
              icon: 'location',
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: SVGIcon(
              icon: 'tag',
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: SVGIcon(
              icon: 'profile',
            ),
            onPressed: () => {},
          ),
          SizedBox(width: 0),
        ],
      ),
    );
  }
}
