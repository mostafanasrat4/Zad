import 'package:flutter/cupertino.dart';
import 'package:zad/models/classes/approval_context_state.dart';
import 'package:zad/models/interfaces/approval_state.dart';

class RejectedState implements ApprovalState {
  final ApprovalContext context;

  RejectedState(this.context);

  @override
  bool approve() {
    return true;
  }

  @override
  bool reject() {
   return false;
  }

  @override
  void process() {
    debugPrint('request is rejected, you can\'t process it');
  }
}
