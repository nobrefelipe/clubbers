import 'package:clubbers/app/modules/events/events_page.dart';
import 'package:clubbers/app/modules/home/home_page.dart';
import 'package:clubbers/app/modules/profile/profile_page.dart';
import 'package:clubbers/app/shared/components/AppBottomBar.dart';
import 'package:flutter/material.dart';

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
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final pageViewController = PageController();

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
          The PageView() will have a page for each
          page we set on AppBottomBar();

          Current pages are: Home, Map, Events and Profile

        */
        children: [
          //
          // Home Module
          //
          HomePage(),
          //
          // Map Module
          //
          Container(),
          //
          // Events Module
          //
          EventsPage(),
          //
          // Profile Module
          //

          ProfilePage(),
        ],
      ),
      bottomNavigationBar: AppBottomBar(pageViewController),
    );
  }
}
