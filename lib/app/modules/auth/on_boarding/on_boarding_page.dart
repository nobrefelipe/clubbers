import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'on_boarding_controller.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState
    extends ModularState<OnBoardingPage, OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //
              // BACKGROUND IMAGE
              //
              Container(
                alignment: Alignment.topCenter,
                height: screenSize.height,
                child: Container(
                  height: screenSize.width / 1.5,
                  padding: EdgeInsets.only(top: screenSize.height / 8),
                  child: Image.asset(
                    "./lib/assets/img/logo-graphics.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),

              //
              // AUTH BOX
              //
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.spacing_big),
                child: Column(
                  children: [
                    //
                    // Welcome text
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        // Welcome Heading
                        //
                        HeadingComfortaa(
                          text: "Olá \nbem-vindo \nao clubbers",
                          heading: 5,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(height: AppStyles.spacing_big),
                        //
                        //  Welcome text
                        //
                        TEXT(
                          text:
                              "Super Happy to share the onboarding screen designs of on-demand delivery app that uses your mobile phone as your address.",
                        ),
                      ],
                    ),
                    //
                    // Auth buttons
                    //
                    SizedBox(height: AppStyles.spacing_extra),
                    Column(
                      children: [
                        //
                        // OnBoarding with EMAIL BUTTON
                        //
                        BUTTON(
                          text: "Entrar com Email",
                          onPressed: () => Modular.to.pushNamed('/login'),
                        ),
                        //
                        // OnBoarding with FACEBOOK BUTTON
                        //
                        BUTTON(
                          text: "Entrar com Facebook",
                          onPressed: () => print("Entrar com Facebook"),
                          primary: false,
                          backgroundColor: Color(0xFF4267B2),
                          textColor: Colors.white,
                        ),
                        //
                        // SIGNUP BUTTON
                        //
                        Container(
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Nāo possui uma conta?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
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
                      ],
                    ),
                    SizedBox(height: screenSize.height / 10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //
          // Top graphics
          //
          Stack(
            children: [
              Container(
                height: screenSize.height / 2.8,
                child: Image.asset(
                  "./lib/assets/img/psy.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: screenSize.height / 2.8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    stops: [0.1, 1.0],
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
          //
          // Welcome text
          //
          Padding(
            padding:
                const EdgeInsets.only(top: 64.0, left: AppStyles.spacing_big),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingComfortaa(
                  text: "Olá \nbem-vindo \nao clubbers",
                  heading: 5,
                  weight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 100.0),
                  child: TEXT(
                    text:
                        "Super Happy to share the onboarding screen designs of on-demand delivery app that uses your mobile phone as your address.",
                  ),
                ),
              ],
            ),
          ),
          //
          // Auth buttons
          //
          SizedBox(height: 32.0),
          Padding(
            padding: AppStyles.spacingBig,
            child: Column(
              children: [
                //
                // OnBoarding with EMAIL BUTTON
                //
                BUTTON(
                  text: "OnBoarding com Email",
                  onPressed: () => print("OnBoarding com email"),
                ),
                //
                // OnBoarding with FACEBOOK BUTTON
                //
                BUTTON(
                  text: "OnBoarding com Facebook",
                  onPressed: () => print("OnBoarding com Facebook"),
                  primary: false,
                  backgroundColor: Color(0xFF4267B2),
                  textColor: Colors.white,
                ),
                //
                // SIGNUP BUTTON
                //
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Nāo possui uma conta?',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Registre-se ',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Registre-se");
                                  },
                              ),
                            ]),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
*/
