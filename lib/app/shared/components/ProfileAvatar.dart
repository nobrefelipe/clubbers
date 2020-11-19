import 'package:cached_network_image/cached_network_image.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';

/*
  PROFILE AVATAR COMPONENT
  This component is used for profile avatars or rounded images

  Its made of two CircleAvatar widgets. 
  To allow us to have a border around the image.

  @param image
  @param hasBorder

*/

class ProfileAvatar extends StatelessWidget {
  final String image;
  final bool hasBorder;

  const ProfileAvatar({this.image, this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: AppStyles.primaryColor,
          child: CircleAvatar(
            radius: hasBorder ? 19.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(image),
          ),
        ),
        VerticalDivider(width: 5),
      ],
    );
  }
}
