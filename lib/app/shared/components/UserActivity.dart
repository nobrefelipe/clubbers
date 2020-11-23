import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ProfileAvatar.dart';

/*
  USER ACTIVITY COMPONENT

  This component draws a circular avatar followed
  but the user name and a some status under it

  @param avatar
  @param name
  @param status
*/

class UserActivity extends StatelessWidget {
  final String avatar;
  final String name;
  final String status;
  final bool hasBorder;

  const UserActivity({
    this.avatar,
    this.name,
    this.status,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ProfileAvatar(
            image: avatar,
            hasBorder: hasBorder,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 125,
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: AppStyles.bodyColor,
                  ),
                ),
              ),
              Text(
                status,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: AppStyles.bodyColor.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
