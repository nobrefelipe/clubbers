import 'package:cached_network_image/cached_network_image.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String image;

  const ProfileAvatar(this.image);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: AppStyles.primaryColor,
          child: CircleAvatar(
            radius: 19.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(image),
          ),
        ),
        VerticalDivider(width: 5),
      ],
    );
  }
}
