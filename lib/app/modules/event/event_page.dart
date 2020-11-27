import 'package:clubbers/app/modules/event/widgets/EventBanner.dart';
import 'package:clubbers/app/modules/event/widgets/EventSliverAppBar.dart';
import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/CLOutlinedButton.dart';
import 'package:clubbers/app/shared/components/CalendarDate.dart';
import 'package:clubbers/app/shared/components/RichTitle.dart';
import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:clubbers/app/shared/components/Time.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'event_controller.dart';

class EventPage extends StatefulWidget {
  final String id;
  const EventPage({this.id});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends ModularState<EventPage, EventController> {
  //
  // Current Event
  //
  Future event;

  @override
  void initState() {
    super.initState();
    event = controller.getEvent(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Observer(
        builder: (context) {
          var currentEvent = controller.event;

          if (currentEvent == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            slivers: [
              //
              // Sliver App Bar
              //
              EventSliverAppBar(currentEvent),
              //
              // Event Banner
              //
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: AppStyles.spacing_big,
                    left: 50,
                    right: AppStyles.spacing_big,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //
                      // Banner
                      //
                      AspectRatioImage(
                        ratio: 16 / 9,
                        image: currentEvent.banner,
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
                          Time(
                            date: DateTime.parse(currentEvent.date),
                          ),
                          Column(
                            children: [
                              TEXT(
                                text: '423',
                                weight: FontWeight.bold,
                                size: 18.0,
                                noMargin: true,
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: TEXT(
                                  text: 'confirmados',
                                  weight: FontWeight.normal,
                                  noMargin: true,
                                  size: 14,
                                ),
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 50,
                        right: AppStyles.spacing_big,
                      ),
                      //
                      // Tickets and price
                      //
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //
                          // Tickets buton
                          //
                          BUTTON(
                            text: "Tickets",
                            width: 150,
                            onPressed: () => print("tickets"),
                          ),
                          //
                          // Price
                          //
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TEXT(
                              text: 'R\$ ${currentEvent.price}',
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey),
                  ],
                ),
              ),
              //
              // Local details
              //
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppStyles.spacing_normal,
                        right: AppStyles.spacing_big,
                      ),
                      child: Row(
                        children: [
                          //
                          // Location Icon
                          //
                          SVGIcon(
                            icon: 'location',
                            color: AppStyles.primaryColor,
                          ),
                          //
                          // Place name
                          //
                          SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: Heading(
                              text: currentEvent.owner['name'],
                              weight: FontWeight.w900,
                              heading: 5,
                              isPrimary: false,
                              lineheight: 0.8,
                            ),
                          ),
                          //
                          // Go to place profile button
                          //
                          CLOutlinedButton(
                            text: "ver club",
                            width: 90,
                            horizontalPadding: 10.0,
                            verticalPadding: 8.0,
                            margin: const EdgeInsets.all(0),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    //
                    // Address, phone, email and description
                    //
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: AppStyles.spacing_big,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //
                          // Address
                          //
                          Container(
                            width: screenSize.width * 0.6,
                            child: TEXT(
                              text: currentEvent.owner['address'],
                              textAlign: TextAlign.left,
                              weight: FontWeight.w600,
                            ),
                          ),
                          //
                          // Phone
                          //
                          TEXT(
                            text: currentEvent.owner['phone'],
                            textAlign: TextAlign.left,
                            noMargin: true,
                          ),
                          //
                          // Email
                          //
                          TEXT(
                            text: currentEvent.owner['email'],
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 30.0),
                          //
                          // Event description
                          //
                          TEXT(
                            text: currentEvent.description,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    // Location title
                    //
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
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
                            text: "${currentEvent.owner['address']}",
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
                      margin:
                          const EdgeInsets.only(top: AppStyles.spacing_normal),
                      child: Image.asset(
                        './lib/assets/img/map.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
