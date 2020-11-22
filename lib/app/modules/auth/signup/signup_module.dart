import 'pages/perfil.dart';
import 'pages/preferences.dart';
import 'signup_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/city.dart';
import 'pages/signup.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SignupController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/signup',
          child: (_, args) => SignupPage(),
        ),
        ModularRouter(
          '/city',
          child: (_, args) => CityPage(),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/preferences',
          child: (_, args) => PreferencesPage(),
          transition: TransitionType.fadeIn,
        ),
        ModularRouter(
          '/perfil',
          child: (_, args) => PerfilPage(),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<SignupModule>.of();
}
