import '../../api/mock/mock.dart';
import 'package:clubbers/app/shared/components/AppBottomBar.dart';
import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/CalendarDate.dart';
import 'package:clubbers/app/shared/components/EventItem.dart';
import 'package:clubbers/app/shared/components/FavoritePlace.dart';
import 'package:clubbers/app/shared/components/FormInput.dart';
import 'package:clubbers/app/shared/components/IconCheckBox.dart';
import 'package:clubbers/app/shared/components/RichTitle.dart';
import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/Time.dart';
import 'package:clubbers/app/shared/components/TitleWithIcon.dart';
import 'package:clubbers/app/shared/components/UserActivity.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      bottomNavigationBar: AppBottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TEXT(
                  text: "Locais favoritos",
                  weight: FontWeight.bold,
                  size: 18,
                  noMargin: true,
                ),
              ),
              Container(
                width: double.infinity,
                height: 260,
                child: Expanded(
                  flex: 1,
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: locals.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return FavoritePlace(
                        localName: locals[index].name.toLowerCase(),
                        localAddress: locals[index].address,
                        image: locals[index].profilePicture,
                      );
                    },
                  ),
                ),
              ),
              ShadowContainer(
                margin: AppStyles.spacingNormal,
                padding: AppStyles.spacingBig,
                child: Column(
                  children: [
                    FormInput(
                      fieldName: "Email",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (v) => null,
                    ),
                    FormInput(
                      fieldName: "Senha",
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      onChanged: (v) => null,
                    ),
                    FormInput(
                      fieldName: "Confirmar Senha",
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      onChanged: (v) => null,
                    ),
                  ],
                ),
              ),
              ShadowContainer(
                margin: AppStyles.spacingNormal,
                padding: AppStyles.spacingBig,
                child: Column(
                  children: [
                    TEXT(
                      text:
                          'Vamos te indicar os  melhores locais em sua cidade. você pode mudar sua cidade preferia quando quiser.',
                      textAlign: TextAlign.center,
                    ),
                    FormInput(
                      fieldName: "Cidade",
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      icon: FontAwesome.location_arrow,
                      onChanged: (v) => null,
                    ),
                  ],
                ),
              ),
              ShadowContainer(
                margin: AppStyles.spacingNormal,
                padding: AppStyles.spacingBig,
                child: Column(
                  children: [
                    TEXT(
                      text:
                          'Selecione um ou mais tipos de locais abaixo. Para podermos mostrar apenas o que você realmente curte.',
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconCheckBox(
                          title: 'baladas',
                          onTap: (value) => print(value),
                        ),
                        IconCheckBox(
                          title: 'barzinhos',
                          onTap: (value) => print(value),
                        ),
                        IconCheckBox(
                            title: 'restaurantes',
                            onTap: (value) => print(value)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BUTTON(
                      text: "Cidade",
                      icon: AntDesign.arrowright,
                      onPressed: () => {
                        print("seguir"),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    BUTTON(
                      text: "Seguir",
                      icon: AntDesign.arrowright,
                      onPressed: () => {
                        print("seguir"),
                      },
                    ),
                    BUTTON(
                      text: "Ver nosso feed",
                      primary: false,
                      onPressed: () => {
                        print("feed"),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TitleWithIcon(
                  customIcon: 'calendar',
                  title: "eventos",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CalendarDate(date: DateTime.parse(events[0].date)),
                    ),
                    EventItem(
                      onTap: () => print('Dennis'),
                      eventDate: DateTime.parse(events[0].date),
                      eventImage: events[0].banner,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CalendarDate(date: DateTime.parse(events[1].date)),
                    ),
                    EventItem(
                      onTap: () => print('astrix'),
                      eventDate: DateTime.parse(events[1].date),
                      eventImage: events[1].banner,
                    ),
                    EventItem(
                      onTap: () => print('kevinho'),
                      eventDate: DateTime.parse(events[2].date),
                      eventImage: events[2].banner,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Time(
                  date: DateTime.now(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CalendarDate(
                  date: DateTime.now(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: UserActivity(
                  avatar: currentUser.profilePicture,
                  name: currentUser.fullName,
                  status: "1hr atrás",
                ),
              ),
              ShadowContainer(
                margin: AppStyles.spacingExtra,
                padding: AppStyles.spacingBig,
                child: Column(
                  children: <Widget>[
                    Heading(
                      text: "psy beach club",
                      weight: FontWeight.w900,
                      heading: 4,
                    ),
                    TEXT(
                      text: "My amazing paragraph is here to stay.",
                      weight: FontWeight.normal,
                    ),
                    TEXT(
                      text: "My amazing paragraph is here to stay.",
                      weight: FontWeight.normal,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SVGIcon(
                          icon: 'profile',
                          active: true,
                        ),
                        SVGIcon(icon: 'tag', color: Colors.blue),
                        SVGIcon(
                          icon: 'home',
                        ),
                        SVGIcon(
                          icon: 'location',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 0.0),
                      child: AspectRatioImage(
                        image:
                            'https://blogjatefalei.files.wordpress.com/2014/11/na-balada.png',
                        ratio: 16 / 9,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichTitle(
                      title: "Local preferido",
                      value: "Psy Beach Club",
                    ),
                    VerticalDivider(),
                    RichTitle(
                      title: "Gosto musical",
                      value: "Eletronica",
                    ),
                    VerticalDivider(),
                    RichTitle(
                      title: "Sexo",
                      value: "Masculino",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
