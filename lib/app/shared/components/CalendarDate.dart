import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
  CALENDAR DATE COMPONENT
  This component draws a calendar date 
  with the day on the top and the month underneeth it.

  It receives a DateTime date as argument
  and we format the date to get day and month.

  For more formatting options, see: https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart

  @param date

*/

class CalendarDate extends StatelessWidget {
  final DateTime date;

  const CalendarDate({this.date});

  @override
  Widget build(BuildContext context) {
    final DateFormat dayFormatter = DateFormat('d');
    final String day = dayFormatter.format(date);

    final DateFormat monthFormatter = DateFormat('MMM');
    final String month = monthFormatter.format(date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Heading(
          text: day.toLowerCase(),
          heading: 5,
          weight: FontWeight.bold,
          lineheight: 0.7,
        ),
        Heading(
          text: month.toLowerCase(),
          heading: 4,
          isPrimary: false,
          weight: FontWeight.bold,
          lineheight: 0.7,
        )
      ],
    );
  }
}
