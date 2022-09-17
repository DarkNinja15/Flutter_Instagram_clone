import 'package:image_picker/image_picker.dart';

imagepicker(ImageSource source) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? _file = await imagePicker.pickImage(
    source: source,
  );
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}
