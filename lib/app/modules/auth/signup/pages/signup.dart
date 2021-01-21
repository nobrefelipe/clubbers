import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/FormInput.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/logo.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends GetView {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      //
      // App bar
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
            onPressed: () => Get.back()),
      ),
      //
      // Home
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.height / 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              // Page Title
              //
              Text(
                "Cadastre-se com email \ne senha",
                textAlign: TextAlign.center,
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppStyles.primaryColor,
                  letterSpacing: -0.8,
                ),
              ),
              SizedBox(height: 20),

              // GetX(
              //   () {
              //     return Text(
              //       "error",
              //       textAlign: TextAlign.center,
              //     );
              //   },
              // ),
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
                  height: 280,
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
                        onChanged: (value) => print(value),
                      ),
                      //
                      // Password
                      //
                      FormInput(
                        fieldName: "Senha",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onChanged: (value) => print(value),
                      ),
                      //
                      // Repeat Password
                      //
                      FormInput(
                        fieldName: "Repetir Senha",
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        //
                        // On submit, lets navigate to the next route
                        //
                        onSubmitted: (value) => Get.toNamed('/auth/signup/city'),
                        onChanged: (value) => print(value),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              //
              // CTA
              //
              Padding(
                padding: const EdgeInsets.only(left: 64.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    //  Go back
                    //
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(padding: EdgeInsets.all(20), color: Colors.transparent, child: Text('Voltar')),
                    ),
                    //
                    //  Next step
                    //
                    BUTTON(
                      text: "Cidade",
                      width: 160,
                      icon: AntDesign.arrowright,
                      onPressed: () => Get.toNamed('/auth/signup/city'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
