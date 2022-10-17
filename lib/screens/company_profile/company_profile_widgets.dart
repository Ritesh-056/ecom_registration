import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../state/provider/file_provider.dart';
import '../../widgets/reusable_widgets.dart';

Widget FileSelectedView(BuildContext context, List<File> file) {
  return Column(
    children: attachFile(context,file),
  );
}

List<Widget> attachFile(BuildContext context,List<File> file) {
  List<Widget> fileWidget = [];
  for (int i = 0; i < file.length; i++) {
    fileWidget.add(
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.description_outlined,
            color: Colors.red,
          ),
          E_comRegistrationSizedHorizontalBox(8.0),
          Expanded(
              child: Text(
                file[i].path.split('/').last,
              )),
          E_comRegistrationSizedHorizontalBox(8.0),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                context.read<FilePickerProvider>().deleteSelectedFile(i);
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
  return fileWidget;
}
