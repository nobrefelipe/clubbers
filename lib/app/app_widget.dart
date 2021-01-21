import 'package:clubbers/app/modules/auth/auth_page.dart';
import 'package:clubbers/app/modules/auth/login/login_page.dart';
import 'package:clubbers/app/modules/auth/on_boarding/on_boarding_page.dart';
import 'package:clubbers/app/modules/auth/signup/pages/city.dart';
import 'package:clubbers/app/modules/auth/signup/pages/preferences.dart';
import 'package:clubbers/app/modules/auth/signup/pages/signup.dart';
import 'package:clubbers/app/modules/event/event_page.dart';
import 'package:clubbers/app/modules/start/start_page.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'modules/auth/signup/pages/profile.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
      Allow only Portrait Mode
    */
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.pink, // status bar color
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clubbers',
      theme: ThemeData(
        scaffoldBackgroundColor: AppStyles.bgColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: AppStyles.bgColor,
        ),
        primaryColor: AppStyles.primaryColor,
      ),
      initialRoute: '/auth/on-boarding',
      getPages: [
        GetPage(
          name: '/auth',
          page: () => AuthPage(),
        ),
        GetPage(
          name: '/auth/on-boarding',
          page: () => OnBoardingPage(),
        ),
        GetPage(
          name: '/auth/signup',
          page: () => SignupPage(),
        ),
        GetPage(
          name: '/auth/signup/city',
          page: () => SignupCityPage(),
        ),
        GetPage(
          name: '/auth/signup/preferences',
          page: () => SignupPreferencesPage(),
        ),
        GetPage(
          name: '/auth/signup/profile',
          page: () => SignupProfilePage(),
        ),
        GetPage(
          name: '/auth/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/start',
          page: () => StartPage(),
        ),
        GetPage(
          name: '/event',
          page: () => EventPage(),
        ),
      ],
    );
  }
}
