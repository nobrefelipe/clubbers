import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/*
  FAVORITE PLACE COMPONENT

  This component draws a widget that represents 
  a favorite location.
  I has a image, place name and address.

  It's used to represent a location that the user 
  has set as favorite.
  And will be displayed on the home and map screens

  @param image
  @param localName
  @param localAddress

*/

class FavoritePlace extends StatelessWidget {
  final String image;
  final String localName;
  final String localAddress;

  const FavoritePlace({
    this.image,
    this.localName,
    this.localAddress,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    final itemSize = deviceWidth / 1.9;

    return Container(
      width: itemSize + 32.0,
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: Stack(
        children: [
          favoritePlaceContent(localName, localAddress, itemSize),
          favoritePlaceImage(image, itemSize),
          moreIcon(),
        ],
      ),
    );
  }
}

/*
  Item image
*/
Widget favoritePlaceImage(image, itemSize) {
  return Positioned(
    right: 0,
    top: 0,
    child: Container(
      width: itemSize - 25,
      child: AspectRatioImage(
        ratio: itemSize / itemSize * 1.20,
        image: image,
      ),
    ),
  );
}

/*
  Item content
*/
Widget favoritePlaceContent(localName, localAddress, itemSize) {
  return Positioned(
    bottom: 0,
    child: Container(
      width: itemSize - 10,
      height: 180,
      child: ShadowContainer(
          padding: const EdgeInsets.only(
            top: 85.0,
            left: 16,
            right: 16,
            bottom: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                text: localName,
                heading: 6,
                weight: FontWeight.w800,
                lineheight: 0.9,
              ),
              TEXT(
                text: localAddress,
                size: 12,
                weight: FontWeight.w600,
              ),
            ],
          )),
    ),
  );
}

/*
  More icon
*/
Widget moreIcon() {
  return Positioned(
    bottom: 12,
    right: 22,
    child: Transform.rotate(
      angle: 1.6,
      child: Icon(
        Ionicons.ios_more,
        size: 18,
        color: Colors.grey[500],
      ),
    ),
  );
}
