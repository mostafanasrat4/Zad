import 'dart:typed_data';

import 'package:zad/models/classes/user.dart';

abstract class IDocument{
  Future<Uint8List?> viewDocument(String userID, User user);
}