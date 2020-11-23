import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:flutter/material.dart';

/*
  BOTTOM NAVIGATION 
*/
class AppBottomBar extends StatelessWidget {
  final PageController controller;

  const AppBottomBar(this.controller);
  @override
  Widget build(BuildContext context) {
    var selectedItem = 0;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          currentIndex: controller?.page?.round() ?? 0,
          onTap: (index) {
            selectedItem = index;
            controller.jumpToPage(index);
          },
          showSelectedLabels: false,
          elevation: 25,
          items: [
            BottomNavigationBarItem(
              label: "home",
              icon: SVGIcon(
                icon: 'home',
                active: selectedItem == 0,
              ),
            ),
            BottomNavigationBarItem(
              label: "map",
              icon: SVGIcon(
                icon: 'location',
                active: selectedItem == 1,
              ),
            ),
            BottomNavigationBarItem(
              label: "events",
              icon: SVGIcon(
                icon: 'tag',
                active: selectedItem == 2,
              ),
            ),
            BottomNavigationBarItem(
              label: "profile",
              icon: SVGIcon(
                icon: 'profile',
                active: selectedItem == 3,
              ),
            ),
          ],
        );
      },
    );
  }
}
