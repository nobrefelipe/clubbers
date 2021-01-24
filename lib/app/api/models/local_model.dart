import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import 'event_model.dart';
import 'post_model.dart';

class Local {
  final String id;
  final String name;
  final String profilePicture;
  final String email;
  final List<Post> posts;
  final String address;
  final List<String> followers;
  final String phone;
  final String description;
  final List<Event> events;
  final List<String> type;
  final LatLng position;

  const Local({
    this.id,
    @required this.name,
    @required this.profilePicture,
    @required this.email,
    this.posts,
    this.address,
    this.followers,
    this.phone,
    this.description,
    this.events,
    this.type,
    this.position,
  });
}
