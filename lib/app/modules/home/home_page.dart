import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}

/*
const List data = [
      {
        "notes": 'Game was played',
        "time": '2017-10-04T20:24:30+00:00',
        "sport": 'hockey',
        "owner": 'steve',
        "players": '10',
        "game_id": 1
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-04T12:35:30+00:00',
        "sport": 'lacrosse',
        "owner": 'steve',
        "players": '6',
        "game_id": 2
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-14T20:32:30+00:00',
        "sport": 'hockey',
        "owner": 'steve',
        "players": '4',
        "game_id": 3
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-04T10:12:30+00:00',
        "sport": 'hockey',
        "owner": 'henry',
        "players": '10',
        "game_id": 4
      },
      {
        "notes": 'Game was played',
        "time": '2017-10-14T20:34:30+00:00',
        "sport": 'soccer',
        "owner": 'john',
        "players": '12',
        "game_id": 5
      }
    ];

    var finalObj = {};

    data.forEach((games) {
      var date = games['time'].split('T')[0];
      if (finalObj[date] != null) {
        finalObj[date].add(games);
      } else {
        finalObj[date] = [games];
      }
    });

    print(finalObj);

*/
