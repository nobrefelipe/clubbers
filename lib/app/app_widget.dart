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

    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Clubbers',
      theme: ThemeData(
        primaryColor: AppStyles.primaryColor,
      ),
      initialRoute: '/auth',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
