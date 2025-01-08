import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class PendingState implements ApprovalState {
  final ApprovalContext context;

  PendingState(this.context);

  @override
  bool approve() {
    context.setState(context.approvedState);
    return true;
  }

  @override
  bool reject() {
    context.setState(context.rejectedState);
    return true;
  }

  @override
  void process() {
    debugPrint("Request is pending, please approve or reject.");
  }
}
