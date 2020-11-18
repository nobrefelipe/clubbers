import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';

/*
  APECT RATIO IMAGE COMPONENT
  This component draws an image with rounded border
  and can have a custom aspect ratio


  @param ratio
  @aparam image

*/

class AspectRatioImage extends StatelessWidget {
  final double ratio;
  final String image;

  const AspectRatioImage({this.ratio, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppStyles.borderRadius15,
        child: AspectRatio(
          aspectRatio: ratio,
          child: FadeInImage.assetNetwork(
            image: image,
            placeholder: './lib/assets/img/placeholder.png',
            fit: BoxFit.cover, // use this
          ),
        ),
      ),
    );
  }
}
