import 'package:clubbers/app/api/mock/locals.dart';
import 'package:clubbers/app/api/models/local_model.dart';
import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/RichTitle.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacePage extends StatefulWidget {
  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  final placeId = Get.parameters;
  ScrollController controller;
  double scrollAmount = 1;
  Local place;

  @override
  void initState() {
    super.initState();
    place = locals.singleWhere((element) => element.id == placeId['id']);

    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset.isNegative) {
        scrollAmount = controller.offset.abs();
        scrollAmount = scrollAmount > 200 ? 200 : scrollAmount;

        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        dragStartBehavior: DragStartBehavior.down,
        controller: controller,
        shrinkWrap: false,
        slivers: [
          //
          // Sliver App Bar
          //
          SliverAppBar(
            toolbarHeight: 68,
            brightness: Brightness.light,
            backgroundColor: AppStyles.bgColor,
            floating: true,
            centerTitle: false,
            //
            // Back button
            //
            leading: IconButton(
              icon: Icon(
                Ionicons.ios_arrow_round_back,
                size: 32,
                color: AppStyles.bodyColor,
              ),
              onPressed: () => Get.back(),
            ),
            //
            // Page Title
            //
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                //
                // Event name
                //
                Heading(
                  text: place.name.toLowerCase(),
                  isPrimary: true,
                  heading: 5,
                  weight: FontWeight.bold,
                ),
                //
                // Full event date
                //
                TEXT(
                  text: place.address,
                  size: 12,
                  weight: FontWeight.w600,
                  noMargin: true,
                ),
                TEXT(
                  text: place.city,
                  size: 12,
                  weight: FontWeight.w600,
                  noMargin: true,
                ),
              ],
            ),
          ),
          //
          // PLACE BANNER
          //
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppStyles.spacing_big,
                left: AppStyles.spacing_big,
                right: AppStyles.spacing_big,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //
                  // Banner
                  //
                  Transform.translate(
                    offset: Offset(0, -1 * scrollAmount),
                    child: Transform.scale(
                      scale: 1 + 1 * scrollAmount / 600,
                      child: Container(
                        height: 200 + 1 * scrollAmount / 4,
                        child: Hero(
                          tag: 'banner-${place.id}',
                          child: AspectRatioImage(
                            ratio: 16 / 9,
                            image: place.profilePicture,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),

                  //
                  // Confirmed
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      // Event timne
                      //
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Ionicons.ios_heart_empty),
                          SizedBox(width: 5),
                          Text(
                            "Favoritar",
                            style: GoogleFonts.comfortaa(
                              color: AppStyles.bodyColor,
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Ionicons.ios_star,
                                size: 18,
                                color: Colors.yellow.shade700,
                              ),
                              Icon(
                                Ionicons.ios_star,
                                size: 18,
                                color: Colors.yellow.shade700,
                              ),
                              Icon(
                                Ionicons.ios_star,
                                size: 18,
                                color: Colors.yellow.shade700,
                              ),
                              Icon(
                                Ionicons.ios_star_half,
                                size: 18,
                                color: Colors.yellow.shade700,
                              ),
                              Icon(
                                Ionicons.ios_star_outline,
                                size: 18,
                                color: Colors.yellow.shade700,
                              ),
                            ],
                          ),
                          RichTitle(
                            title: "seguidores",
                            value: "532",
                            alignment: CrossAxisAlignment.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                  //
                  //
                  //
                ],
              ),
            ),
          ),

          //
          // PLACE DETAILS
          //
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppStyles.spacing_big),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  // PLACE NAME
                  //
                  Heading(
                    text: place.name.toLowerCase(),
                    isPrimary: true,
                    heading: 4,
                    weight: FontWeight.w800,
                  ),
                  SizedBox(height: 10),
                  //
                  // PLACE PHONE
                  //
                  TEXT(
                    text: place.phone,
                    weight: FontWeight.bold,
                    noMargin: true,
                  ),
                  //
                  // PLACE EMAIL
                  //
                  TEXT(
                    text: place.email,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Ver cardàpio",
                    style: GoogleFonts.comfortaa(
                      color: AppStyles.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15),
                  //
                  // PLACE DESCRIPTION
                  //
                  TEXT(
                    text: place.description,
                  ),

                  SizedBox(height: 20),
                  //
                  // CTAs
                  //
                  Row(
                    children: [
                      //
                      // FOLLOW BUTTON
                      //
                      BUTTON(
                        text: "Follow",
                        width: 150,
                        onPressed: () => print("tickets"),
                      ),
                      //
                      // SEE FEED BUTTON
                      //
                      BUTTON(
                        text: "Ver nosso feed",
                        width: 150,
                        primary: false,
                        onPressed: () => print("feed"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //
          // PLACE LOCATION
          //
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                // Location title
                //
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppStyles.spacing_big,
                    top: AppStyles.spacing_big,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Heading(
                        text: "localizaçāo",
                        weight: FontWeight.w900,
                        heading: 5,
                        isPrimary: false,
                      ),
                      //
                      // Address
                      //
                      TEXT(
                        text: "${place.address}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                //
                // Map
                //
                Container(
                  height: 340,
                  margin: const EdgeInsets.only(top: AppStyles.spacing_normal),
                  child: Image.asset(
                    './lib/assets/img/map.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
