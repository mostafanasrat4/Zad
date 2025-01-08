import 'package:zad/models/classes/approved_state.dart';
import 'package:zad/models/classes/pending_state.dart';
import 'package:zad/models/classes/rejected_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class ApprovalContext {
  late ApprovalState pendingState;
  late ApprovalState approvedState;
  late ApprovalState rejectedState;
  late ApprovalState currentState;

  ApprovalContext() {
    pendingState = PendingState(this);
    approvedState = ApprovedState(this);
    rejectedState = RejectedState(this);
    currentState = pendingState; // Initial state is Pending
  }

  void setState(ApprovalState state) {
    currentState = state;
  }

  void approve() {
    currentState.approve();
  }

  void reject() {
    currentState.reject();
  }

  void process() {
    currentState.process();
  }
}
