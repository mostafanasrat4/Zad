import '../interfaces/ICommand.dart';

class CommandInvoker {
  final List<Command> _history = [];

  void executeCommand(Command command) {
    command.execute();
    _history.add(command);
  }

  void undoLastCommand() {
    if (_history.isNotEmpty) {
      final command = _history.removeLast();
      command.undo();
    }
  }
}
