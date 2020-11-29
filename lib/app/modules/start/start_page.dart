import 'package:clubbers/app/app_controller.dart';
import 'package:clubbers/app/modules/events/events_module.dart';
import 'package:clubbers/app/modules/home/home_module.dart';
import 'package:clubbers/app/modules/profile/profile_module.dart';
import 'package:clubbers/app/shared/components/AppBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'start_controller.dart';

/*
  The modules is responsable for implementing the
  bottom navigation bar.

  The PageView() accepts a controller which we use to
  navigate though the pages.

  We pass the pageViewController down to AppBottomBar()
  and when we tap on a page icon, we call the jumpToPage(index)
  method of the PageController, passing the index of the page;

*/

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  final pageViewController = PageController();
  AppController appController = Modular.get<AppController>();

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        physics: NeverScrollableScrollPhysics(),
        /*
          The PageView() will have a module for each
          page we set on AppBottomBar();

          Current pages are: Home, Map, Events and Profile

        */
        children: [
          //
          // Home Module
          //
          RouterOutlet(
            initialRoute: '/home',
            module: HomeModule(),
          ),
          //
          // Map Module
          //
          Container(),
          //
          // Events Module
          //
          RouterOutlet(
            initialRoute: '/events',
            module: EventsModule(),
          ),
          //
          // Profile Module
          //
          RouterOutlet(
            initialRoute: '/profile/${appController.currentUser.id}',
            module: ProfileModule(),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomBar(pageViewController),
    );
  }
}
