import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'signup_controller.g.dart';

@Injectable()
class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  //
  // FULL NAME
  //
  @observable
  var fullName;

  @action
  void getName(value) {
    fullName = value;
    print(email);
  }

  //
  // EMAIL
  //
  @observable
  var email;

  @action
  void getEmail(value) {
    email = value;
    print(email);
  }

  //
  // PASSWORD
  //
  @observable
  var password;

  @action
  void getPassword(value) {
    password = value;
    print(password);
  }

  //
  // CITY
  //
  @observable
  var city;

  @action
  void getCity(value) {
    city = value;
    print(city);
  }

  //
  // PREFERENCES
  //
  @observable
  List preferences = [];

  @action
  void getPreferences(key) {
    preferences.indexOf(key) > -1
        ? preferences.remove(key)
        : preferences.add(key);
    print(preferences);
  }
}
