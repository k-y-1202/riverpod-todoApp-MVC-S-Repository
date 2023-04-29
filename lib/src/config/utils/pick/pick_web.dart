import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';

class Pick {
  Future<Uint8List?> pickFile() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    if (bytesFromPicker == null) return null;
    return bytesFromPicker;
  }
}
