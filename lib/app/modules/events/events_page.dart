import 'package:clubbers/app/api/models/event_model.dart';
import 'package:clubbers/app/shared/components/CalendarDate.dart';
import 'package:clubbers/app/shared/components/CustomAppBar.dart';
import 'package:clubbers/app/shared/components/EventItem.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';
import 'events_controller.dart';

class EventsPage extends StatefulWidget {
  final String title;
  const EventsPage({Key key, this.title = "Events"}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends ModularState<EventsPage, EventsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //
      // App bar
      // This is a custom AppBar, thus we are using PreferedSize
      //
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          pageTitle: "events",
          showback: false,
        ),
      ),
      body: Observer(
        builder: (context) {
          //
          // Get events object
          //
          var eventsByDate = controller.eventsByDate;

          return Container(
            child: InfiniteList(
              posChildCount: eventsByDate.length,
              builder: (BuildContext context, int index) {
                /*
                    Lets get the events for each date 
                    and add to a list of events
                  */
                List<List<Event>> eventItems = [];

                /*
                    Lets get the events date
                    and add to a list of dates
                  */
                List<String> eventsDates = [];

                /*
                     For each event by date lets extract the dates
                     and the events list and put them into 
                     separated lists;
                     We will use these 2 lists below to render the 
                     event date group and the event item
                  */
                eventsByDate.forEach((eventDate, eventsByDateList) {
                  /*
                      Lets create a list of event dates
                    */
                  eventsDates.add(eventDate);
                  /*
                      Lets get the List of events for a given
                      date and add to the eventItems List
                    */
                  eventItems.add(eventsByDateList);
                });

                return InfiniteListItem(
                  /*
                      EVENT DATE
                      The event date will be a sticky header

                      We generate one sticky element for each date
                      we dont repeat dates.

                      Instead all events with the same date will be 
                      rendered under the same header
                    */

                  headerBuilder: (BuildContext context) {
                    return Container(
                      width: 100,
                      color: AppStyles.bgColor,
                      padding: const EdgeInsets.only(
                        top: AppStyles.spacing_normal,
                        bottom: AppStyles.spacing_normal,
                      ),
                      child: CalendarDate(
                        date: DateTime.parse(
                          eventsDates[index],
                        ),
                      ),
                    );
                  },

                  /*
                      EVENT ITEM
                      Here we display an event item under 
                      an event date 
                    */
                  contentBuilder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.only(
                        right: AppStyles.spacing_normal,
                      ),
                      child: Column(
                        children: [
                          for (var event in eventItems[index])
                            EventItem(
                              onTap: () => print(event.name),
                              eventDate: DateTime.parse(event.date),
                              eventImage: event.banner,
                            ),
                        ],
                      ),
                    );
                  },
                  positionAxis: HeaderPositionAxis.mainAxis,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
