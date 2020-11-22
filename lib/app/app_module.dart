import 'package:clubbers/app/modules/auth/auth_module.dart';
import 'package:clubbers/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:clubbers/app/app_widget.dart';

import 'modules/auth/login/login_module.dart';
import 'modules/auth/on_boarding/on_boarding_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: AuthModule(),
          transition: TransitionType.fadeIn,
        ), // /auth
        ModularRouter(
          '/on-boarding',
          module: OnBoardingModule(),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/login',
          module: LoginModule(),
        ),
        ModularRouter(
          '/home',
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
