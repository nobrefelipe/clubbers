import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key key, this.title = "Auth"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  bool loading = false;

  bool isLoggedIn = false;

  // CHECK IF USER IS LOGGED IN
  checkLogin() async {
    isLoggedIn = await controller.checkLogin();

    // If not logged in
    if (!isLoggedIn) {
      // Navigate to login
      Modular.to.pushNamedAndRemoveUntil('/login', (Route route) => false);
    } else {
      // Navigate to home
      Modular.to.pushNamedAndRemoveUntil('/home', (Route route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    //
    //Check if logged in
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
