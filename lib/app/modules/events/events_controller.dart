import 'package:clubbers/app/api/mock/events.dart';
import 'package:clubbers/app/api/models/event_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'events_controller.g.dart';

@Injectable()
class EventsController = _EventsControllerBase with _$EventsController;

abstract class _EventsControllerBase with Store {
  _EventsControllerBase() {
    // Call geEvents()
    // in the cosntructor so we get the events when EventsHomeController is instanciated
    getEvents();
  }

  @observable
  List<Event> allEvents;

  @observable
  Map<dynamic, List<Event>> eventsByDate;

  /*
    SORT EVENTS
    Let's sort events and group them by date.
    This method will return something like:
    {
      "2020-22-20" : [ Event, Event, Event],
      "2020-22-21" : [ Event, Event]
    }

  */
  @action
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

    eventsByDate = finalObj;
  }

  @action
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
