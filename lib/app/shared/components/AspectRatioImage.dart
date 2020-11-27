import 'package:cached_network_image/cached_network_image.dart';
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
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(-5, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppStyles.borderRadius10,
        child: AspectRatio(
          aspectRatio: ratio,
          child: CachedNetworkImage(
            placeholder: (_, __) => Container(
              child: Image.asset(
                './lib/assets/img/placeholder.png',
                fit: BoxFit.cover,
              ),
            ),
            imageUrl: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
