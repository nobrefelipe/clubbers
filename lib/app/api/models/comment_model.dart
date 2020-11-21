import 'user_model.dart';

class Comment {
  final String updatedAt;
  final String content;
  final String createdAt;
  final String id;
  final User author;
  final String postId;

  const Comment({
    this.updatedAt,
    this.author,
    this.content,
    this.createdAt,
    this.postId,
    this.id,
  });
}
