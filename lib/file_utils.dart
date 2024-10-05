import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FileUtils {
  static Future<String?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      // Đọc nội dung file
      String content = await file.readAsString();
      return content;
    } else {
      return null;
    }
  }
}
