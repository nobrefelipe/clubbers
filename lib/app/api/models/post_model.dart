import 'like_model.dart';
import 'local_model.dart';
import 'user_model.dart';

class Post {
  final String id;
  final List<User> taggedUsers;
  final String updatedAt;
  final String content;
  final String createdAt;
  final String commentsAggragate;
  // final List<String> comments;
  final String likesAggragate;
  // final List<Like> likes;
  final String authorId;
  final User author;
  final String localId;
  final Local local;

  Post({
    this.taggedUsers,
    this.updatedAt,
    this.localId,
    this.authorId,
    this.content,
    this.createdAt,
    this.id,
    this.commentsAggragate,
    this.likesAggragate,
    this.author,
    this.local,
  });
}
