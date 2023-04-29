import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Pick {
  Future<Uint8List?> pickFile() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    final uint8List = await image.readAsBytes();
    return uint8List;
  }
}
