import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/FormInput.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/components/logo.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SignupProfilePage extends GetView {
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
          onPressed: () => Get.back(),
        ),
      ),
      //
      // Home
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.height / 7),
          /*
            OBSERVER
            Observe for changes in any @observable in the controller
            so we update the view when those change

            As this view is the last step in the registration flow
            we observe controller.loading to change to give feedbacl to the user
          */
          child: GetBuilder(
            builder: (_) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //
                  // Page Title
                  //
                  Text(
                    "Foto de perfil \ne nome completo",
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
                              "Toque para editar",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          //
                          // Profile Image
                          //
                          GestureDetector(
                            onTap: () => print("take picture"),
                            child: Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.only(bottom: AppStyles.spacing_big),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(FontAwesome.picture_o),
                            ),
                          ),
                          //
                          // Full name
                          //
                          FormInput(
                            fieldName: "Nome Completo",
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.text,
                            onSubmitted: (value) => {},
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
                          child:
                              Container(padding: EdgeInsets.all(20), color: Colors.transparent, child: Text('Voltar')),
                        ),
                        //
                        //  Next step
                        //
                        // TODO: disable button if name is empty. See original version
                        BUTTON(
                          text: "Finalizar",
                          width: 160,
                          icon: AntDesign.arrowright,
                          onPressed: () => Get.offNamedUntil('/start', (Route route) => false),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
