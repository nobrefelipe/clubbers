import 'events_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'events_page.dart';

class EventsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $EventsController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/events', child: (_, args) => EventsPage()),
      ];

  static Inject get to => Inject<EventsModule>.of();
}
