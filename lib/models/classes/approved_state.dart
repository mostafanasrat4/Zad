import 'package:flutter/material.dart';
import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class ApprovedState implements ApprovalState {
  final ApprovalContext context;

  ApprovedState(this.context);

  @override
  bool approve() {
    return false;
  }

  @override
  bool reject() {
    return true;
  }

  @override
  void process() {
    debugPrint("Request is approved and processed.");
  }
}
