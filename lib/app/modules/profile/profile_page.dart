import 'package:cached_network_image/cached_network_image.dart';
import 'package:clubbers/app/api/mock/users.dart';
import 'package:clubbers/app/api/models/user_model.dart';
import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/DotsIndicator.dart';
import 'package:clubbers/app/shared/components/FavoritePlaces.dart';
import 'package:clubbers/app/shared/components/RichTitle.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfilePage extends GetView {
  @override
  Widget build(BuildContext context) {
    final _galleryPageController = new PageController();

    User user = users[0];

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        //
        // Panel Settings
        //
        backdropEnabled: true,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        minHeight: screenSize.height * 0.4,
        maxHeight: screenSize.height * 0.8,
        header: slidePanelHeader(screenSize),
        //
        // Add radius to the panel
        //
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        panel: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: AppStyles.spacing_normal,
                right: AppStyles.spacing_normal,
                bottom: AppStyles.spacing_small,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //
                      // User Name
                      //
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text(
                            user.fullName,
                            style: GoogleFonts.biryani(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: AppStyles.bodyColor,
                              height: 1.2,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                      //
                      // Followers Count
                      //
                      Expanded(
                        flex: 1,
                        child: RichTitle(
                          title: 'seguidores',
                          value: "232",
                          alignment: CrossAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  //
                  // Call to Actions
                  //
                  Row(
                    children: [
                      //
                      // Follow
                      //
                      BUTTON(
                        text: "Seguir",
                        width: 120,
                        onPressed: () => {
                          print("seguir"),
                        },
                      ),
                      //
                      // Poke
                      //
                      BUTTON(
                        width: 120,
                        text: "Intimar",
                        primary: false,
                        onPressed: () => {
                          print("feed"),
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //
            // User Details
            //
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //
                    // Favorite Place
                    //
                    RichTitle(
                      title: "Local preferido",
                      value: user.mostFavoritePlace.name,
                    ),
                    VerticalDivider(width: 25),
                    //
                    // Favorite Music Type
                    //
                    RichTitle(
                      title: "Gosto musical",
                      value: user.favoriteMusicStyle,
                    ),
                    VerticalDivider(width: 25),
                    //
                    // Gender
                    //
                    RichTitle(
                      title: "Sexo",
                      value: user.gender,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(AppStyles.spacing_normal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TEXT(
                    text: "Locais favoritos",
                    weight: FontWeight.bold,
                    size: 16,
                    noMargin: true,
                  ),
                  SizedBox(height: AppStyles.spacing_normal),
                  FavoritePlaces(
                    places: user.favoritePlaces,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: userGallery(_galleryPageController, screenSize, user),
      ),
    );
  }
}

/*
  User Gallery
  This s the slidehsow with the user's pictures
*/
Widget userGallery(_galleryPageController, screenSize, currentUser) {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: screenSize.height * 0.4),
        child: PageView.builder(
          controller: _galleryPageController,
          itemCount: currentUser.gallery.length,
          itemBuilder: (_, index) {
            return CachedNetworkImage(
              placeholder: (_, __) => Container(
                child: Image.asset(
                  './lib/assets/img/placeholder.png',
                  fit: BoxFit.cover,
                ),
              ),
              imageUrl: currentUser.gallery[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
      Positioned(
        bottom: screenSize.height * 0.53,
        left: 0.0,
        right: 0.0,
        child: Center(
          child: DotsIndicator(
            controller: _galleryPageController,
            itemCount: currentUser.gallery.length,
            color: AppStyles.primaryColor,
          ),
        ),
      ),
    ],
  );
}

/*
  Slide Panel Header
  this whoe the scrollable indicator on the top of the profile slider
*/
Container slidePanelHeader(screenSize) {
  return Container(
    width: screenSize.width,
    alignment: Alignment(0.0, 0.0),
    child: Container(
      width: 100,
      height: 6,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[400],
      ),
    ),
  );
}
