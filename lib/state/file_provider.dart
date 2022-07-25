import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FilePickerProvider with ChangeNotifier{

  File? file;
  getFileFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
       file = File(result.files.single.path!);
       notifyListeners();
    }else{
      file = null;
    }
  }
}


