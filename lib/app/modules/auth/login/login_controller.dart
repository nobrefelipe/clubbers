import 'dart:ffi';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  var email;

  @action
  void getEmail(value) {
    email = value;
    print(email);
  }

  @observable
  var password;

  @action
  void getPassword(value) {
    password = value;
    print(password);
  }
}
