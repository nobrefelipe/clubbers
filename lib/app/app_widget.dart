import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
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
      initialRoute: '/auth',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
