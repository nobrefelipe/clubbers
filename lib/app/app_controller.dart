import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'api/mock/users.dart';
import 'api/models/user_model.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  _AppControllerBase() {
    // id will come from local storage
    getCurrentUser(1);
  }

  @observable
  User currentUser = users.first;

  @action
  Future getCurrentUser(id) async {
    return currentUser = await Future.delayed(
      Duration(milliseconds: 100),
      () => users.where((user) => user.id == id).first,
    );
  }
}
