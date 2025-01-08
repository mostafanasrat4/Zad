

import 'dart:typed_data';

abstract class IImageAdapter {
  Future<String?> pickAndCompressImageToString();
  Uint8List? stringToImage(String base64String);
}