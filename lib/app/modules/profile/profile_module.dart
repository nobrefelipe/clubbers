import 'profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'profile_page.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ProfileController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/profile/:id',
            child: (_, args) => ProfilePage(id: args.params['id'])),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
