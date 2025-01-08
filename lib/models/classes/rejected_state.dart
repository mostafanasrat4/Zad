import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class RejectedState implements ApprovalState {
  final ApprovalContext context;

  RejectedState(this.context);

  @override
  void approve() {
    print("Cannot approve, the request is rejected.");
  }

  @override
  void reject() {
    print("Already rejected.");
  }

  @override
  void process() {
    print("Request is rejected and cannot be processed.");
  }
}
