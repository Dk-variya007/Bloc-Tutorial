import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> cameraPicker() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  static Future<XFile?> imageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
