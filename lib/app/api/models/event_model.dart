import 'package:meta/meta.dart';
import 'local_model.dart';
import 'user_model.dart';

class Event {
  final String id;
  final String name;
  final List<User> usersGoingIds;
  final String updatedAt;
  final String localId;
  final String ticketLink;
  final String description;
  final String createdAt;
  final String date;
  final String banner;
  final String price;
  final List<String> artists;
  final Local owner;

  Event({
    this.date,
    this.name,
    this.banner,
    this.price,
    this.artists,
    this.owner,
    this.usersGoingIds,
    this.updatedAt,
    this.localId,
    this.ticketLink,
    this.description,
    this.createdAt,
    this.id,
  });
}
