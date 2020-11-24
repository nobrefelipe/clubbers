import 'package:clubbers/app/shared/components/AspectRatioImage.dart';
import 'package:clubbers/app/shared/components/Time.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

/*
  EVENT ITEM COMPONENT

  THis component is responsible for the
  event item with event date and banner 

  It also has a onTap event used for navigating
  to the event detail screen

  This component will be used within the Sticky Infinit List plugin
  to create a position sticky effect
  see: https://pub.dev/packages/sticky_infinite_list

  @param eventImage
  @param eventDate
  @param onTap

*/

class EventItem extends StatelessWidget {
  final String eventImage;
  final DateTime eventDate;
  final Function onTap;

  const EventItem({this.eventImage, this.eventDate, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Stack(
                  alignment: Alignment(-0.3, -0.2),
                  children: [
                    /*
                      Dotted Line
                    */
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DottedLine(
                        direction: Axis.vertical,
                        dashLength: 2,
                        dashGapLength: 6,
                        lineThickness: 2,
                        dashRadius: 4,
                        dashColor: Colors.grey[500],
                      ),
                    ),
                    /*
                      Event time
                     */
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Time(
                        date: eventDate,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /*
              Event banner
            */
            Expanded(
              flex: 2,
              child: Container(
                child: AspectRatioImage(
                  image: eventImage,
                  ratio: 280 / 170,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
