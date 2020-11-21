import 'package:meta/meta.dart';
import 'local_model.dart';
import 'post_model.dart';

class User {
  final String id;
  final String fullName;
  final String profilePicture;
  final String email;
  final List<Post> posts;
  final String defaultLocation;
  final String favoriteMusicStyle;
  final List<String> favoritePlaces;
  final String followersAggregate;
  final String gender;
  final bool isOnline;
  final Local mostFavoritePlace;
  final List<place_types> placesPreference;
  final String password;

  const User({
    this.posts,
    this.defaultLocation,
    this.favoriteMusicStyle,
    this.favoritePlaces,
    this.followersAggregate,
    this.gender,
    this.id,
    this.isOnline,
    this.mostFavoritePlace,
    this.placesPreference,
    this.email,
    this.password,
    @required this.fullName,
    @required this.profilePicture,
  });
}