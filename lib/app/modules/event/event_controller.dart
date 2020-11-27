import 'package:clubbers/app/api/mock/events.dart';
import 'package:clubbers/app/api/models/event_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'event_controller.g.dart';

@Injectable()
class EventController = _EventControllerBase with _$EventController;

abstract class _EventControllerBase with Store {
  @observable
  Event event;

  @action
  Future getEvent(id) async {
    return event = await Future.delayed(
      Duration(milliseconds: 100),
      () => events.where((event) => event.id == id).first,
    );
  }
}
