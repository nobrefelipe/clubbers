import 'package:clubbers/app/modules/auth/auth_module.dart';
import 'package:clubbers/app/modules/event/event_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:clubbers/app/app_widget.dart';
import 'modules/auth/login/login_module.dart';
import 'modules/auth/on_boarding/on_boarding_module.dart';
import 'modules/auth/signup/signup_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/start/start_module.dart';
import 'app_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [$AppController];

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
          '/signup',
          module: SignupModule(),
        ),
        ModularRouter(
          '/start',
          module: StartModule(),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/event',
          module: EventModule(),
        ),
        ModularRouter(
          '/profile',
          module: ProfileModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
