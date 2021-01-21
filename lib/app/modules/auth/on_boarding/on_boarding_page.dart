import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPage extends GetView {
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
                padding: const EdgeInsets.symmetric(horizontal: AppStyles.spacing_big),
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
                          onPressed: () => Get.toNamed('/auth/login'),
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
                                style: TextStyle(color: Colors.black, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Cadastre-se ',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed('/auth/signup'),
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
