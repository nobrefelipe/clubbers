import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/FormInput.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/logo.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // Appbar
      //
      appBar: AppBar(
        elevation: 0,
        title: Logo(),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Ionicons.ios_arrow_round_back,
            size: 32,
            color: AppStyles.bodyColor,
          ),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      //
      // Body
      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            // Page Title
            //
            Text(
              "Entrar com email",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppStyles.primaryColor,
                letterSpacing: -0.8,
              ),
            ),
            SizedBox(height: 20),
            //
            // Login Box
            //
            ShadowContainer(
              margin: EdgeInsets.symmetric(
                horizontal: AppStyles.spacing_big,
                vertical: AppStyles.spacing_normal,
              ),

              //
              // Input Fields
              //
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    //
                    // Email
                    //
                    FormInput(
                      fieldName: "Email",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => controller.getEmail(value),
                    ),
                    //
                    // Password
                    //
                    FormInput(
                      fieldName: "Senha",
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (value) => controller.getPassword(value),
                    ),
                    //
                    // SIGNUP BUTTON
                    //
                    Container(
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Nāo possui uma conta?',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Cadastre-se ',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => Modular.to.pushNamed('/signup'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 64.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  // Back
                  //
                  GestureDetector(
                    onTap: () => Modular.to.pop(),
                    child: Text('Voltar'),
                  ),
                  //
                  // Login button
                  //
                  BUTTON(
                    text: "Login",
                    width: 200,
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
