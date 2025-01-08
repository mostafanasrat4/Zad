import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class ApprovedState implements ApprovalState {
  final ApprovalContext context;

  ApprovedState(this.context);

  @override
  void approve() {
    print("Already approved.");
  }

  @override
  void reject() {
    print("Cannot reject, it is already approved.");
  }

  @override
  void process() {
    print("Request is approved and processed.");
  }
}
