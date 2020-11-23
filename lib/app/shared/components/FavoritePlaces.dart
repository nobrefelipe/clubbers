import 'package:clubbers/app/api/models/local_model.dart';
import 'package:clubbers/app/shared/components/FavoritePlace.dart';
import 'package:flutter/material.dart';

class FavoritePlaces extends StatelessWidget {
  final List<Local> places;

  const FavoritePlaces({this.places});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final Local place = places[index];

          return FavoritePlace(
            localName: place.name.toLowerCase(),
            localAddress: place.address,
            image: place.profilePicture,
          );
        },
      ),
    );
  }
}
