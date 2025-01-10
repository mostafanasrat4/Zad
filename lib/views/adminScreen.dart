import 'package:flutter/material.dart';
import 'package:zad/controllers/adminController.dart';
import 'package:zad/models/classes/event.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _EventManagementScreenState();
}

class _EventManagementScreenState extends State<AdminScreen> {
  final AdminController _adminController = AdminController();
  List<Event> _events = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    setState(() => _isLoading = true);
    _events = await _adminController.getAllEvents();
    setState(() => _isLoading = false);
  }

  void _addEvent() async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    String eventType = "workshop";
    DateTime eventDate = DateTime.now();
    List<String> skillsNeeded = [];

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Event"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Event Name"),
                ),
                TextField(
                  controller: locationController,
                  decoration:
                      const InputDecoration(labelText: "Event Location"),
                ),
                TextField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(labelText: "Event Description"),
                ),
                DropdownButton<String>(
                  value: eventType,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => eventType = value);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                        value: "workshop", child: Text("Workshop")),
                    DropdownMenuItem(
                        value: "fundraiser", child: Text("Fundraiser")),
                    DropdownMenuItem(value: "social", child: Text("Social")),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: eventDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      setState(() => eventDate = selectedDate);
                    }
                  },
                  child: const Text("Select Event Date"),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: skillsNeeded
                      .map((skill) => Chip(
                            label: Text(skill),
                            onDeleted: () =>
                                setState(() => skillsNeeded.remove(skill)),
                          ))
                      .toList(),
                ),
                TextField(
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      setState(() => skillsNeeded.add(value));
                    }
                  },
                  decoration: const InputDecoration(labelText: "Add Skill"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    locationController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  String eventId =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  String userId = "adminID";
                  await _adminController.addEventWithFactory(
                    type: eventType,
                    id: eventId,
                    name: nameController.text,
                    location: locationController.text,
                    date: eventDate,
                    userID: userId,
                    description: descriptionController.text,
                    skillsNeeded: skillsNeeded,
                  );
                  _loadEvents();
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _deleteEvent(String eventId) async {
    await _adminController.deleteEvent(eventId);
    _loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Management"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addEvent,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _events.isEmpty
              ? const Center(child: Text("No events available"))
              : ListView.builder(
                  itemCount: _events.length,
                  itemBuilder: (context, index) {
                    final event = _events[index];
                    return ListTile(
                      title: Text(event.name),
                      subtitle: Text(
                          "Type: ${event.type} | Location: ${event.location}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteEvent(event.id),
                      ),
                    );
                  },
                ),
    );
  }
}
