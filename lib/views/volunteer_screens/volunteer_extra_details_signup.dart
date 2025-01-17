import 'package:flutter/material.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/services/volunteer_manager.dart';

class VolunteerSignUp extends StatefulWidget {
  Volunteer myVolunteer;
  VolunteerSignUp({super.key, required this.myVolunteer});

  @override
  State<VolunteerSignUp> createState() => _VolunteerSignUpState();
}

class _VolunteerSignUpState extends State<VolunteerSignUp> {
  // Controllers for text input
  TextEditingController _skillsController = TextEditingController();
  TextEditingController _preferencesController = TextEditingController();

  // Lists to store user selections
  List<String> skills = [];
  List<DateTime> availability = [];
  List<String> preferences = [];

  // Function to show a date picker for availability
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        availability.add(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Skills Input
            TextField(
              controller: _skillsController,
              decoration: InputDecoration(
                labelText: "Add a skill",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_skillsController.text.isNotEmpty) {
                      setState(() {
                        skills.add(_skillsController.text);
                        _skillsController.clear();
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            // Display selected skills
            Wrap(
              spacing: 8.0,
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  onDeleted: () {
                    setState(() {
                      skills.remove(skill);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Availability Picker
            ElevatedButton(
              onPressed: _pickDate,
              child: Text("Add Availability"),
            ),
            SizedBox(height: 10),
            // Display selected availability
            Wrap(
              spacing: 8.0,
              children: availability.map((date) {
                return Chip(
                  label: Text("${date.toLocal()}"),
                  onDeleted: () {
                    setState(() {
                      availability.remove(date);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Preferences Input
            TextField(
              controller: _preferencesController,
              decoration: InputDecoration(
                labelText: "Add a preference",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_preferencesController.text.isNotEmpty) {
                      setState(() {
                        preferences.add(_preferencesController.text);
                        _preferencesController.clear();
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            // Display selected preferences
            Wrap(
              spacing: 8.0,
              children: preferences.map((preference) {
                return Chip(
                  label: Text(preference),
                  onDeleted: () {
                    setState(() {
                      preferences.remove(preference);
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              //ToDo: NAVIGATION
              widget.myVolunteer.skills = skills;
              widget.myVolunteer.availability = availability;
              widget.myVolunteer.preferrences = preferences;
              VolunteerManager().editUser(widget.myVolunteer);
            }, child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}