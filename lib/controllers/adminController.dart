import 'package:uuid/uuid.dart';
import 'package:zad/models/classes/beneficiary.dart';
import 'package:zad/models/classes/collections_of_topics.dart';
import 'package:zad/models/classes/event.dart';
import 'package:zad/models/services/FCM_services.dart';
import 'package:zad/models/services/Observer_manager.dart';
import 'package:zad/models/services/beneficiaryManager.dart';
import 'package:zad/models/services/event_manager.dart';

class AdminController {
  final EventManager _eventManager = EventManager();


  Future<void> addEventWithFactory({
    required String type,
    required String id,
    required String name,
    required String location,
    required DateTime date,
    required String userID,
    required String description,
    required List<String> skillsNeeded,
  }) async {
    try {
      await _eventManager.addEventWithFactory(
        type,
        id = Uuid().v1(),
        name,
        location,
        date,
        userID,
        description,
        skillsNeeded,
      );
      ObserverManager().notify(collections_of_topics().newEvent, 'new event', 'check it out');
    } catch (e) {
      print("Error adding event: $e");
    }
  }

  Future<void> editEvent(Event event) async {
    await _eventManager.EditEvent(event);
  }


  Future<void> deleteEvent(String id) async {
    await _eventManager.DeleteEvent(id);
  }

  // Fetch All Events
  Future<List<Event>> getAllEvents() async {
    return await _eventManager.getAllEvents();
  }
  Future<void> getPendingBeneificaries()async{
    await BeneficiaryManager().getPendingBeneficiaries();
  }
  Future<void> approveBeneficiary(Beneficiary ben) async{
    await BeneficiaryManager().approveBeneficiary(ben.id, ben.approvalContext.approvedState.toString());
    FcmServices().sendFCMMessage('Congratulations', 'You just got approved', ben.id);
  }
  Future<void> disapproveBeneficiary(Beneficiary ben) async{
    FcmServices().sendFCMMessage('I am sorry', 'You just got disapproved, check your documents', ben.id);
    await BeneficiaryManager().disapproveBeneficiary(ben.id, ben.approvalContext.rejectedState.toString());
  }

}
