import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class PendingState implements ApprovalState {
  final ApprovalContext context;

  PendingState(this.context);

  @override
  void approve() {
    print("Approved!");
    context.setState(context.approvedState);
  }

  @override
  void reject() {
    print("Rejected!");
    context.setState(context.rejectedState);
  }

  @override
  void process() {
    print("Request is pending, please approve or reject.");
  }
}
