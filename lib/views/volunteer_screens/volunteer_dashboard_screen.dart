import 'package:flutter/material.dart';
import 'package:zad/controllers/Sort_Events_strats.dart';
import 'package:zad/controllers/volunteer_dashboard_controller.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/registeredEventCommand.dart';
import 'package:zad/models/classes/unregisteredEventCommand.dart';
import 'package:zad/models/services/event_list.dart';
import 'package:zad/views/widgets/Event_card_template.dart';
import 'package:zad/views/volunteer_screens/Event_details_screen.dart';

import '../../controllers/interfaces/ISort_Events.dart';
import '../../models/classes/event_registeration.dart';
import '../../models/services/CommandInvoker.dart';

class VolunteerDashboardScreen extends StatefulWidget {
  const VolunteerDashboardScreen({super.key});

  @override
  _VolunteerDashboardScreenState createState() =>
      _VolunteerDashboardScreenState();
}

class _VolunteerDashboardScreenState extends State<VolunteerDashboardScreen> {
  final VolunteerDashboardController _controller =
      VolunteerDashboardController();
  final setStrategy _sortStrategy = setStrategy();
  final CommandInvoker _invoker = CommandInvoker();
  EventList eventList = EventList([]);
  List<Event> _events = [];
  late ISortEvents _currentSortingStrategy;
  String _selectedSorting = "Date";
  String _selectedFilter = "All Events";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _currentSortingStrategy = _sortStrategy.switchStrategy(_selectedSorting);
    _loadEvents(_selectedFilter);
  }

  var userid = 'ahmed';
  Future<void> _loadEvents(String filter) async {
    setState(() => _isLoading = true);

    switch (filter) {
      case "Future Events":
        _events = await _controller.getFutureEvents();
        setState(() {
          eventList = EventList(_events);
          _isLoading = false;
        });
        break;
      case "Registered Events":
        _events = await _controller.getVolunteerRegisteredEvents2(userid);
        setState(() {
          eventList = EventList(_events);
          _isLoading = false;
        });
        break;
      case "Attended Events":
        _events = await _controller.getVolunteerAttendedEvents();
        setState(() {
          eventList = EventList(_events);
          _isLoading = false;
        });
        break;
      default: // "All Events"
        eventList = (await _controller.getEvents()) as EventList;
        setState(() {
          eventList = EventList(_events);
          _isLoading = false;
        });
    }

    _events = _currentSortingStrategy.sortEvents(_events);
    setState(() => _isLoading = false);
  }

  void _applySorting(String sorting) {
    setState(() {
      _selectedSorting = sorting;
      _currentSortingStrategy = _sortStrategy.switchStrategy(sorting);
      _events = _currentSortingStrategy.sortEvents(_events);
    });
  }

  void _registerForEvent(Event event) async {
    final eventRegistration = EventRegisteration(event.id, userid, false);
    final command = RegisterEventCommand(
        _controller.getRegistrationManager(), eventRegistration);
    _invoker.executeCommand(command);
    _loadEvents(_selectedFilter);
  }

  void _unregisterFromEvent(Event event) async {
    final eventRegistration = EventRegisteration(
        event.id, userid, false);
    final command = UnregisterEventCommand(
        _controller.getRegistrationManager(), eventRegistration);
    _invoker.executeCommand(command);
    _loadEvents(_selectedFilter);
  }

  void _undoLastAction() {
    _invoker.undoLastCommand();
    _loadEvents(_selectedFilter);
  }

  @override
  Widget build(BuildContext context) {
    final iterator = eventList.createIterator();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volunteer Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: _undoLastAction,
          ),
          IconButton(onPressed: (){VolunteerDashboardController().subscribeToEvent();}, icon:const Icon(Icons.notifications),),
          Row(
            children: [
              DropdownButton<String>(
                value: _selectedFilter,
                onChanged: (value) {
                  if (value != null) {
                    _selectedFilter = value;
                    _loadEvents(value);
                  }
                },
                items: const [
                  DropdownMenuItem(
                      value: "All Events", child: Text("All Events")),
                  DropdownMenuItem(
                      value: "Future Events", child: Text("Future Events")),
                  DropdownMenuItem(
                      value: "Registered Events",
                      child: Text("Registered Events")),
                  DropdownMenuItem(
                      value: "Attended Events", child: Text("Attended Events")),
                ],
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _selectedSorting,
                onChanged: (value) {
                  if (value != null) _applySorting(value);
                },
                items: const [
                  DropdownMenuItem(value: "Date", child: Text("Sort by Date")),
                  DropdownMenuItem(
                      value: "Location", child: Text("Sort by Location")),
                  DropdownMenuItem(value: "Type", child: Text("Sort by Type")),
                  DropdownMenuItem(
                      value: "Skill", child: Text("Sort by Skill")),
                ],
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : iterator.hasNext()
              ? ListView.builder(
                  itemCount: eventList.events.length,
                  itemBuilder: (context, index) {
                    final event = iterator.next();

                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsScreen(myEvent: event!)));
                      },
                      child: EventCard(
                          name: event!.name,
                          location: event.location,
                          date: event.date,
                          footer: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () => _registerForEvent(event),
                                child: const Text("Register"),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () => _unregisterFromEvent(event),
                                child: const Text("Unregister"),
                              ),
                            ],
                          )).buildCard(),
                    );
                  },
                )
              : const Center(child: Text("No events available")),
    );
  }
}
