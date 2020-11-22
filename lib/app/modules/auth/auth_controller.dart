import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/api/models/models.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  //
  // CURRENT USER
  //
  @observable
  User user = currentUser;

  //
  // CHECK IF LOGGED IN
  //
  @action
  Future<bool> checkLogin() {
    return Future.delayed(Duration(seconds: 2), () {
      return currentUser != null;
    });
  }
}
