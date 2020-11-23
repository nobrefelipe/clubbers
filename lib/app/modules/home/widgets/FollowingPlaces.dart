import 'package:clubbers/app/api/models/local_model.dart';
import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:clubbers/app/shared/components/ProfileAvatar.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FollowingPlaces extends StatelessWidget {
  final List<Local> places;

  const FollowingPlaces({this.places});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final Local place = places[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            margin: const EdgeInsets.only(bottom: AppStyles.spacing_small),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey[300],
              )
            ]),
            child: ListTile(
              onTap: () => print("sdklmdlsmkdmslkmdklsmk"),
              //
              // Place Profile Image
              //
              leading: AspectRatioImage(
                ratio: 1 / 1,
                image: place.profilePicture,
              ),
              //
              // Place Name
              //
              title: Text(place.name),
              //
              // Icon
              //
              trailing: Transform.rotate(
                angle: 1.6,
                child: Icon(
                  Ionicons.ios_more,
                  size: 18,
                  color: Colors.grey[500],
                ),
              ),
            ),
          );
        },
        childCount: places.length,
      ),
    );
  }
}
