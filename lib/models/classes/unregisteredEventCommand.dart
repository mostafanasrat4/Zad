import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/services/event_registeration_manager.dart';
import '../interfaces/ICommand.dart';

class UnregisterEventCommand implements Command {
  final EventRegisterationManager _manager;
  final EventRegisteration _eventRegistration;

  UnregisterEventCommand(this._manager, this._eventRegistration);

  @override
  void execute() {
    _manager.unregisterEvent(_eventRegistration);
  }

  @override
  void undo() {
    _manager.registerEvent(_eventRegistration);
  }
}
