import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/FormInput.dart';
import 'package:clubbers/app/shared/components/IconCheckBox.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/logo.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../signup_controller.dart';

class PreferencesPage extends StatefulWidget {
  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState
    extends ModularState<PreferencesPage, SignupController> {
  //use 'controller' variable to access controller

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
          onPressed: () => Modular.to.pop(),
        ),
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
                "Quais tipos de locais \nvocê està interessado?",
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
                  height: 280,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      // Description
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Selecione um ou mais tipos de locais abaixo para indicarmos apenas o que você realmente te interessa.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      //
                      // Options
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconCheckBox(
                            name: 'baladas',
                            onTap: (value) =>
                                controller.getPreferences('baladas'),
                          ),
                          IconCheckBox(
                            name: 'barzinhos',
                            onTap: (value) =>
                                controller.getPreferences('barzinhos'),
                          ),
                          IconCheckBox(
                            name: 'restaurantes',
                            onTap: (value) =>
                                controller.getPreferences('restaurantes'),
                          ),
                        ],
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
                      onTap: () => Modular.to.pop(),
                      child: Text('Voltar'),
                    ),
                    //
                    //  Next step
                    //
                    BUTTON(
                      text: "Perfil",
                      width: 160,
                      icon: AntDesign.arrowright,
                      onPressed: () => Modular.to.pushNamed('/signup/perfil'),
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
