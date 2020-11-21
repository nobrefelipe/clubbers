import '../models/models.dart';
import 'users.dart';

final List<Post> posts = [
  Post(
    id: "1",
    createdAt: "2020-11-30T20:14:30+00:00",
    author: currentUser,
    localId: "2",
    content: 'Check out these cool puppers',
    likesAggragate: "40",
    commentsAggragate: "21",
  ),
  Post(
    id: "2",
    createdAt: "2020-11-30T20:14:30+00:00",
    author: users[1],
    localId: "1",
    content: 'Check out these cool puppers',
    likesAggragate: "40",
    commentsAggragate: "21",
  ),
  Post(
    id: "3",
    createdAt: "2020-11-30T20:14:30+00:00",
    author: users[2],
    localId: "1",
    content: 'Check out these cool puppers',
    likesAggragate: "40",
    commentsAggragate: "21",
  ),
  Post(
    id: "4",
    createdAt: "2020-11-30T20:14:30+00:00",
    author: users[1],
    localId: "1",
    content: 'Check out these cool puppers',
    likesAggragate: "40",
    commentsAggragate: "21",
  ),
  Post(
    id: "5",
    createdAt: "2020-11-30T20:14:30+00:00",
    author: currentUser,
    localId: "1",
    content: 'Check out these cool puppers',
    likesAggragate: "40",
    commentsAggragate: "21",
  ),
];
