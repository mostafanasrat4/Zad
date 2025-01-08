import '../interfaces/ICommand.dart';

class CommandInvoker {
  final List<Command> _history = [];

  Future<void> executeCommand(Command command) async {
    command.execute();
    _history.add(command);
  }

  Future<void> undoLastCommand() async {
    if (_history.isNotEmpty) {
      final command = _history.removeLast();
      command.undo();
    }
  }
}
