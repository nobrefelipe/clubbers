import 'package:meta/meta.dart';
import 'event_model.dart';
import 'post_model.dart';

enum place_types {
  balada, // club
  barzinho, // pub
  restaurante, // restaurant
}

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
  final List<place_types> type;

  const Local({
    this.posts,
    this.address,
    this.phone,
    this.description,
    this.followers,
    this.id,
    this.events,
    this.type,
    @required this.email,
    @required this.name,
    @required this.profilePicture,
  });
}
