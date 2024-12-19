/*
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zad/firebase_options.dart';
import 'package:zad/models/classes/admin.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/document.dart';
import 'package:zad/models/classes/donation.dart';
import 'package:zad/models/classes/donation_details.dart';
import 'package:zad/models/classes/donor.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/classes/user.dart';
import 'package:zad/models/classes/volunteer.dart';
import 'package:zad/models/services/Donation_details_manager.dart';
import 'package:zad/models/services/adminManager.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/document_manager.dart';
import 'package:zad/models/services/donation_manager.dart';
import 'package:zad/models/services/donor_manager.dart';
import 'package:zad/models/services/event_manager.dart';
import 'package:zad/models/services/event_registeration_manager.dart';
import 'package:zad/models/services/user_manager.dart';
import 'package:zad/models/services/volunteer_manager.dart';

List<User> generateUsers(int numberOfUsers) {
  List<User> users = [];
  for (int i = 0; i < numberOfUsers; i++) {
    String userId = 'user_$i';
    String name = 'User $i';
    String email = 'user$i@example.com';
    String phoneNo = '123-456-789$i';
    String imageURL = 'https://example.com/image$i.jpg';

    // Create the user instance
    User user = User(userId, name, email, phoneNo, imageURL, 'user');
    users.add(user);
  }
  return users;
}

List<Admin> generateAdmins(List<User> users) {
  List<Admin> admins = [];
  for (var user in users) {
    Admin admin = Admin(id: user.id, name: user.fullName, email: user.email, number: user.phoneNo, imageURL: user.imageURL);
    admins.add(admin);
  }
  return admins;
}

List<Volunteer> generateVolunteers(List<User> users) {
  List<Volunteer> volunteers = [];
  for (var user in users) {
    Volunteer volunteer = Volunteer(
      id: user.id,
      fullName: user.fullName,
      email: user.email,
      phoneNo: user.phoneNo,
      imageURL: user.imageURL,
      skills: ['Skill'],
      availability: [DateTime.now()],
      preferrences: ['Preference'],
    );
    volunteers.add(volunteer);
  }
  return volunteers;
}

List<Beneficiary> generateBeneficiaries(List<User> users) {
  List<Beneficiary> beneficiaries = [];
  for (var user in users) {
    Beneficiary beneficiary = Beneficiary(
      donationNeeded: Random().nextDouble() * 1000,
      donationReceived: 0.0,
      status: 'pending',
      reason: 'Need help for project',
      date: DateTime.now().toIso8601String(),
      location: 'Location',
      requiredDocumentsID: 'document_id',
      id: user.id,
      fullName: user.fullName,
      email: user.email,
      phoneNo: user.phoneNo,
      imageURL: user.imageURL,
    );
    beneficiaries.add(beneficiary);
  }
  return beneficiaries;
}

List<Donor> generateDonors(List<User> users) {
  List<Donor> donors = [];
  for (var user in users) {
    Donor donor = Donor(id: user.id, fullName: user.fullName, email: user.email, phoneNo: user.phoneNo, imageURL: user.imageURL);
    donors.add(donor);
  }
  return donors;
}

List<Document> generateDocuments(int numberOfUsers) {
  List<Document> documents = [];
  for (int i = 0; i < numberOfUsers; i++) {
    String documentId = 'document_$i';
    Document document = Document(
      id: documentId,
      url: 'https://example.com/document$i.pdf',
      title: 'Document $i',
      description: 'Description for document $i',
    );
    documents.add(document);
  }
  return documents;
}

List<Event> generateEvents(List<User> users, int numberOfUsers) {
  List<Event> events = [];
  for (int i = 0; i < numberOfUsers; i++) {
    String eventId = 'event_$i';
    Event event = Event(
      'Event $i',
      'Description for event $i',
      DateTime.now().add(Duration(days: i)),
      eventId,
      'Location $i',
      'user_${i % numberOfUsers}', // FK to User
      ['Skill ${i % 5}'],
      'Type $i',
    );
    events.add(event);
  }
  return events;
}

List<Donation> generateDonations(List<User> users, int numberOfUsers) {
  List<Donation> donations = [];
  for (int i = 0; i < numberOfUsers; i++) {
    String donationId = 'donation_$i';
    Donation donation = Donation(
      donationId,
      'beneficiary_${i % numberOfUsers}', // FK to Beneficiary
      'user_${i % numberOfUsers}', // FK to User
      Random().nextInt(500), // Random donation amount
    );
    donations.add(donation);
  }
  return donations;
}

List<DonationDetails> generateDonationDetails(List<Donation> donations) {
  List<DonationDetails> donationDetailsList = [];
  for (var donation in donations) {
    DonationDetails donationDetails = DonationDetails(
      donation.id,
      DateTime.now(),
      'Credit Card',
    );
    donationDetailsList.add(donationDetails);
  }
  return donationDetailsList;
}

List<EventRegisteration> generateEventRegistrations(List<Event> events, List<User> users) {
  List<EventRegisteration> eventRegistrations = [];
  for (var event in events) {
    EventRegisteration eventRegistration = EventRegisteration(
      event.id,
      'user_${Random().nextInt(users.length)}', // FK to User
      Random().nextBool(), // Random attendance status
    );
    eventRegistrations.add(eventRegistration);
  }
  return eventRegistrations;
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   int numberOfUsers = 10;

  // Generate users
  List<User> users = await generateUsers(numberOfUsers);

  // Generate corresponding lists for admins, volunteers, beneficiaries, and donors
  List<Admin> admins = await generateAdmins(users);
  List<Volunteer> volunteers = await generateVolunteers(users);
  List<Beneficiary> beneficiaries = await generateBeneficiaries(users);
  List<Donor> donors = await generateDonors(users);

  // Generate other entities
  List<Document> documents = await generateDocuments(numberOfUsers);
  List<Event> events = await generateEvents(users, numberOfUsers);
  List<Donation> donations = await generateDonations(users, numberOfUsers);
  List<DonationDetails> donationDetailsList = await generateDonationDetails(donations);
  List<EventRegisteration> eventRegistrations = await generateEventRegistrations(events, users);

  for(var user in users) {
    UserManager().createUser(user);
  }

  for(var admin in admins) {
    AdminManager().createAdmin(admin);
  }

  for(var volunteer in volunteers) {
    VolunteerManager().createVolunteer(volunteer);
  }

  for(var beneficiary in beneficiaries) {
    BenficiaryManager().createBeneficiary(beneficiary);
  }

  for(var donor in donors) {
    DonorManager().createDonor(donor);
  }

  for(var document in documents) {
    DocumentManager().uploadDocument(document);
  }

  for(var event in events) {
    EventManager().AddEvent(event);
  }

  for(var donation in donations) {
    DonationManager().createDonation(donation);
  }
  for(var donationDetail in donationDetailsList) {
    DonationDetailsManager().createDonationDetails(donationDetail);
  }

  for(var eventRegistration in eventRegistrations) {
    EventRegisterationManager().registerEvent(eventRegistration);
  }


  // Access and print lists
  print('Users:');
  users.forEach((user) => print(user.toMap()));

  print('\nAdmins:');
  admins.forEach((admin) => print(admin.toMap()));

  print('\nVolunteers:');
  volunteers.forEach((volunteer) => print(volunteer.toMap()));

  print('\nBeneficiaries:');
  beneficiaries.forEach((beneficiary) => print(beneficiary.toMap()));

  print('\nDonors:');
  donors.forEach((donor) => print(donor.toMap()));

  print('\nDocuments:');
  documents.forEach((document) => print(document.toMap()));

  print('\nEvents:');
  events.forEach((event) => print(event.toMap()));

  print('\nDonations:');
  donations.forEach((donation) => print(donation.toMap()));

  print('\nDonation Details:');
  donationDetailsList.forEach((detail) => print(detail.toMap()));

  print('\nEvent Registrations:');
  eventRegistrations.forEach((registration) => print(registration.toMap()));
}
*/
