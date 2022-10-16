import 'package:ecom_registration/helper/get_file_binary.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SelectedDocumentViewScreen extends StatefulWidget {
  final String file ;
  const SelectedDocumentViewScreen({Key? key, required this.file}) : super(key: key);

  @override
  State<SelectedDocumentViewScreen> createState() => _SelectedDocumentViewScreenState();
}

class _SelectedDocumentViewScreenState extends State<SelectedDocumentViewScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('View Screen'),
        ),
      ),
    );
  }
}
