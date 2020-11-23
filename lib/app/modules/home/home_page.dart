import 'package:clubbers/app/api/mock/locals.dart';
import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/shared/components/AppBottomBar.dart';
import 'package:clubbers/app/shared/components/FavoritePlaces.dart';
import 'package:clubbers/app/shared/components/UsersCheckedIn.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'widgets/FollowingPlaces.dart';
import 'widgets/HomeAppBar.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(),
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

/*
const List data = [
      {
        "notes": 'Game was played',
        "time": '2017-10-04T20:24:30+00:00',
        "sport": 'hockey',
        "owner": 'steve',
        "players": '10',
        "game_id": 1
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-04T12:35:30+00:00',
        "sport": 'lacrosse',
        "owner": 'steve',
        "players": '6',
        "game_id": 2
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-14T20:32:30+00:00',
        "sport": 'hockey',
        "owner": 'steve',
        "players": '4',
        "game_id": 3
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-04T10:12:30+00:00',
        "sport": 'hockey',
        "owner": 'henry',
        "players": '10',
        "game_id": 4
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-14T20:34:30+00:00',
        "sport": 'soccer',
        "owner": 'john',
        "players": '12',
        "game_id": 5
      }
    ];

    var finalObj = {};

    data.forEach((games) {
      var date = games['time'].split('T')[0];
      if (finalObj[date] != null) {
        finalObj[date].add(games);
      } else {
        finalObj[date] = [games];
      }
    });

    print(finalObj);

*/
