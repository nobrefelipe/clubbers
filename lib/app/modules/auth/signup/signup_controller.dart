import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/shared/components/Modal.dart';
import 'package:clubbers/app/shared/components/Spinner.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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

  //
  // SIGNUP
  //

  @action
  Future<void> signup(context) async {
    //
    //  SHOW FEED BACK MODAL
    //
    Navigator.of(context).push(
      MODAL(
        title: "Quase la!",
        content: Column(
          children: [
            TEXT(
              textAlign: TextAlign.center,
              text:
                  "Estamos criando a tua conta Estamos criando a tua conta Estamos criando a tua conta Estamos criando a tua conta  criando a tua conta",
            ),
            SizedBox(height: 20),
            Spinner(icon: FontAwesome.spinner),
          ],
        ),
      ),
    );

    //
    // CREATE THE USER
    //
    Future.delayed(Duration(seconds: 5), () {
      // Create the user
      currentUser = users.first;

      // If we got a user, navigate to the home page
      if (currentUser != null)
        Modular.to.pushNamedAndRemoveUntil(
          '/home',
          (Route route) => false,
        );
    });
  }
}
