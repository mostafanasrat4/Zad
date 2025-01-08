import 'package:flutter/material.dart';
import 'package:zad/controllers/volunteer_dashboard_controller.dart';
import 'package:zad/controllers/Sort_Events_strats.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/views/widgets/eventCard.dart';
import '../controllers/interfaces/ISort_Events.dart';

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

  Future<void> _loadEvents(String filter) async {
    setState(() => _isLoading = true);

    switch (filter) {
      case "Future Events":
        _events = await _controller.getFutureEvents();
        break;
      case "Registered Events":
        _events = await _controller.getVolunteerRegisteredEvents();
        break;
      case "Attended Events":
        _events = await _controller.getVolunteerAttendedEvents();
        break;
      default: // "All Events"
        _events = await _controller.getEvents();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volunteer Dashboard"),
        actions: [
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
          : _events.isNotEmpty
              ? ListView.builder(
                  itemCount: _events.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: _events[index]);
                  },
                )
              : const Center(child: Text("No events available")),
    );
  }
}
