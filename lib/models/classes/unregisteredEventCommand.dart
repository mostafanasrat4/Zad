import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/services/event_registeration_manager.dart';
import '../interfaces/ICommand.dart';

class UnregisterEventCommand implements Command {
  final EventRegisterationManager _manager;
  final EventRegisteration _eventRegistration;

  UnregisterEventCommand(this._manager, this._eventRegistration);

  @override
  Future<void> execute() async {
    _manager.unregisterEvent(_eventRegistration);
  }

  @override
  Future<void> undo() async {
    _manager.registerEvent(_eventRegistration);
  }
}
