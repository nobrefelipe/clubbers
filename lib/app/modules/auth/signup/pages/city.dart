import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/FormInput.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/logo.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../signup_controller.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends ModularState<CityPage, SignupController> {
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
                "Escolha uma cidade \npreferida",
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
                          "Vamos te indicar os  melhores locais em sua cidade. Você pode mudar sua cidade preferia quando quiser.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      //
                      // City
                      //
                      FormInput(
                        fieldName: "Cidade",
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.text,
                        icon: FontAwesome.map_marker,
                        onSubmitted: (value) =>
                            Modular.to.pushNamed('/signup/preferences'),
                        onChanged: (value) => controller.getCity(value),
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
                      child: Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.transparent,
                          child: Text('Voltar')),
                    ),
                    //
                    //  Next step
                    //
                    BUTTON(
                      text: "Preferências",
                      width: 160,
                      icon: AntDesign.arrowright,
                      onPressed: () =>
                          Modular.to.pushNamed('/signup/preferences'),
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
