import '../models/models.dart';
import 'locals.dart';

final User currentUser = users.first;

final List<User> users = [
  User(
    fullName: 'Felipe Nobre Ferreira',
    email: "nobrefelipe1@gmail.com",
    password: "123",
    favoritePlaces: ['1', '2', '3', '4', '5'],
    mostFavoritePlace: locals[0],
    favoriteMusicStyle: "Eletronica",
    gender: "Masculino",
    followersAggregate: "332",
    placesPreference: [
      place_types.balada,
      place_types.barzinho,
    ],
    profilePicture:
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    fullName: 'Natalia Colognesi Scliped',
    email: "nataliasclipet@gmail.com",
    password: "123",
    favoritePlaces: ['3', '4'],
    mostFavoritePlace: locals[1],
    favoriteMusicStyle: "Rock",
    gender: "Feminino",
    followersAggregate: "4123",
    placesPreference: [
      place_types.balada,
      place_types.barzinho,
    ],
    profilePicture:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    fullName: 'Matthew Hinkle',
    email: "m@gmail.com",
    password: "123",
    favoritePlaces: ['1', '2', '3', '4'],
    mostFavoritePlace: locals[2],
    favoriteMusicStyle: "Sertanejo",
    gender: "Masculino",
    followersAggregate: "163",
    placesPreference: [
      place_types.balada,
      place_types.barzinho,
      place_types.restaurante
    ],
    profilePicture:
        'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  // User(
  //   fullName: 'Amy Smith',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  // ),
  // User(
  //   fullName: 'Ed Morris',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  // ),
  // User(
  //   fullName: 'Carolyn Duncan',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  // ),
  // User(
  //   fullName: 'Paul Pinnock',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  // ),
  // User(
  //     fullName: 'Elizabeth Wong',
  //     password: "123",
  //     profilePicture:
  //         'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  // User(
  //   fullName: 'James Lathrop',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  // ),
  // User(
  //   fullName: 'Jessie Samson',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  // ),
  // User(
  //   fullName: 'David Brooks',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  // ),
  // User(
  //   fullName: 'Jane Doe',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  // ),
  // User(
  //   fullName: 'Matthew Hinkle',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  // ),
  // User(
  //   fullName: 'Amy Smith',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  // ),
  // User(
  //   fullName: 'Ed Morris',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  // ),
  // User(
  //   fullName: 'Carolyn Duncan',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  // ),
  // User(
  //   fullName: 'Paul Pinnock',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  // ),
  // User(
  //     fullName: 'Elizabeth Wong',
  //     password: "123",
  //     profilePicture:
  //         'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  // User(
  //   fullName: 'James Lathrop',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  // ),
  // User(
  //   fullName: 'Jessie Samson',
  //   password: "123",
  //   profilePicture:
  //       'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  // ),
];
