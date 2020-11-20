import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

/*
  TIME COMPONENT
  This component draws a calendar time
  with a clock icon

  It receives a DateTime date as argument
  and we format the date to get time

  For more formatting options, see: https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart

  @param date

*/

class Time extends StatelessWidget {
  final DateTime date;

  const Time({this.date});

  @override
  Widget build(BuildContext context) {
    final DateFormat timeFormatter = DateFormat('H:mm');
    final String time = timeFormatter.format(date);

    return Container(
      constraints: BoxConstraints(maxWidth: 60),
      child: Row(
        children: [
          /** 
           * CLOCK ICON  
           */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: AppStyles.bodyColor.withOpacity(0.3),
                ),
              ],
            ),
            child: SVGIcon(
              icon: 'clock',
              color: AppStyles.primaryColor,
              scale: 0.7,
            ),
          ),
          /** 
           * TIME  
           */
          Padding(
            padding: const EdgeInsets.only(left: 4.0, bottom: 1.0),
            child: Text(
              time,
              style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppStyles.bodyColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
