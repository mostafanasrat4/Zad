import 'package:zad/models/classes/volunteer.dart';

abstract class IVolunteerManager {
  Future<void> createVolunteer(Volunteer myVolunteer);
  Future<void> editVolunteer(Volunteer myVolunteer);
  Future<void> removeVolunteer(String id);
  Future<List<Volunteer>> getVolunteers();
  Future<Volunteer?> getVolunteer(String id);
}