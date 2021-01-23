import 'package:clubbers/app/api/models/local_model.dart';
import 'package:clubbers/app/shared/components/FavoritePlace.dart';
import 'package:flutter/material.dart';

import 'CustomPageView.dart';

class FavoritePlaces extends StatelessWidget {
  final List<Local> places;

  const FavoritePlaces({this.places});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      child: CustomPageView.builder(
        controller: PageController(viewportFraction: 0.6),
        itemBuilder: (BuildContext ctxt, int index) {
          final Local place = places[index];

          return FavoritePlace(
            localName: place.name.toLowerCase(),
            localAddress: place.address,
            image: place.profilePicture,
          );
        },
        viewportDirection: false,
      ),
    );
  }
}
