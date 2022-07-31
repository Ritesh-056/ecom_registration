import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'registration_page.dart';

class DocumentListDetailScreen extends StatefulWidget {
  final String title;
  final String description;

  const DocumentListDetailScreen(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  _DocumentListDetailScreenState createState() =>
      _DocumentListDetailScreenState();
}

class _DocumentListDetailScreenState extends State<DocumentListDetailScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: DetailScreenItems()));
  }

  Widget DetailScreenItems() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Title'),
          Text(widget.title),
          SizedBox(
            height: 8.0,
          ),
          Text('Description'),
          Text(widget.description)
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
