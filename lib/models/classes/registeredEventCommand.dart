import 'package:zad/models/classes/event_registeration.dart';
import 'package:zad/models/services/event_registeration_manager.dart';

import '../interfaces/ICommand.dart';

class RegisterEventCommand implements Command {
  final EventRegisterationManager _manager;
  final EventRegisteration _eventRegistration;

  RegisterEventCommand(this._manager, this._eventRegistration);

  @override
  Future<void> execute() async {
    _manager.registerEvent(_eventRegistration);
  }

  @override
  Future<void> undo() async {
    _manager.unregisterEvent(_eventRegistration);
  }
}
