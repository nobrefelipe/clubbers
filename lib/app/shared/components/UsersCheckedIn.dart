import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/api/models/user_model.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/UserActivity.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';

class UsersCheckedIn extends StatelessWidget {
  final List<User> users;

  const UsersCheckedIn({this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        clipBehavior: Clip.none,
        itemBuilder: (BuildContext context, int index) {
          final User user = users[index];
          return Container(
            child: ShadowContainer(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(right: AppStyles.spacing_normal),
              child: UserActivity(
                avatar: user.profilePicture,
                name: user.fullName,
                status: user.checkedInPlace,
                hasBorder: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
