import 'package:clubbers/app/api/models/event_model.dart';
import 'package:clubbers/app/shared/components/CalendarDate.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventSliverAppBar extends StatelessWidget {
  final Event currentEvent;

  const EventSliverAppBar(this.currentEvent);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
            text: currentEvent.name.toLowerCase(),
            isPrimary: true,
            heading: 5,
            weight: FontWeight.bold,
          ),
          //
          // Full event date
          //
          TEXT(
            weight: FontWeight.w600,
            size: 12,
            text: _customFormatDate(DateTime.parse(currentEvent.date), 'd MMMM y'),
          ),
        ],
      ),
      //
      // Event date
      //
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
            right: AppStyles.spacing_big,
          ),
          child: CalendarDate(
            date: DateTime.parse(currentEvent.date),
          ),
        )
      ],
    );
  }
}

_customFormatDate(date, format) {
  final DateFormat formatter = DateFormat(format);
  final String formattedDate = formatter.format(date);
  return formattedDate;
}
