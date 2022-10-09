import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerProvider with ChangeNotifier {

   List<File> files= [];

   getFileFromStorage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
       var listFiles = result.paths.map((path) => File(path!)).toList();
       files.addAll(listFiles);
       notifyListeners();
    } else {
      files ;
    }
  }

   deleteSelectedFile(int index)  {
     files.removeAt(index);
     notifyListeners();
   }
}
