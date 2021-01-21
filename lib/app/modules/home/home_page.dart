import 'package:clubbers/app/api/mock/locals.dart';
import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/shared/components/FavoritePlaces.dart';
import 'package:clubbers/app/shared/components/UsersCheckedIn.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/FollowingPlaces.dart';
import 'widgets/HomeAppBar.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //
          // HOME APP BAR
          //
          HomeAppBar(),
          /*
            CHECKED IN USERS
            Here we show a ListView with users that have 
            checked in a specific local. So other users can know
            that friends are out.
          */
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppStyles.spacing_normal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("No rolê agora"),
                  SizedBox(height: AppStyles.spacing_small),
                  UsersCheckedIn(users: checkedInUsers),
                ],
              ),
            ),
          ),
          /*
            FAVORITE PLACES
            Here we show a ListView of the favorite places
            the user is following
          */
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppStyles.spacing_normal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TEXT(
                    text: "Locais favoritos",
                    weight: FontWeight.bold,
                    size: 18,
                    noMargin: true,
                  ),
                  SizedBox(height: AppStyles.spacing_normal),
                  FavoritePlaces(places: locals),
                ],
              ),
            ),
          ),

          /*
            OTHER PLACES
            Here we show a ListView of all places
            the user is following
          */
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: FollowingPlaces(places: locals),
          ),
        ],
      ),
    );
  }
}
