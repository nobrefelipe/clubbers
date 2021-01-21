import 'package:clubbers/app/api/mock/events.dart';
import 'package:clubbers/app/api/models/event_model.dart';

import 'package:get/get.dart';

class EventsController extends GetxController {
  @override
  void onInit() {
    getEvents();
    super.onInit();
  }

  List<Event> allEvents = <Event>[].obs;

  Map<dynamic, List<Event>> _eventsByDate = <dynamic, List<Event>>{}.obs;
  Map<dynamic, List<Event>> get eventsByDate => _eventsByDate;

  /*
    SORT EVENTS
    Let's sort events and group them by date.
    This method will return something like:
    {
      "2020-22-20" : [ Event, Event, Event],
      "2020-22-21" : [ Event, Event]
    }

  */

  void sortEvents(events) {
    Map<dynamic, List<Event>> finalObj = {};

    allEvents.forEach((event) {
      var date = event.date.split(' ')[0];
      if (finalObj[date] != null) {
        finalObj[date].add(event);
      } else {
        finalObj[date] = [event];
      }
    });

    _eventsByDate = finalObj;
    print(_eventsByDate);
  }

  void getEvents() {
    //
    // TODO: Get events with repository
    //
    allEvents = events;

    //
    // SORT EVENTS
    //
    sortEvents(allEvents);
  }
}
