import 'event_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'event_page.dart';

class EventModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $EventController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/:id',
            child: (_, args) => EventPage(id: args.params['id'])),
      ];

  static Inject get to => Inject<EventModule>.of();
}
