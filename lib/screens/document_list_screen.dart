import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'document_list_detail_screen.dart';
import 'registration_page.dart';

class DocumentListScreen extends StatefulWidget {
  const DocumentListScreen({Key? key}) : super(key: key);

  @override
  _DocumentListScreenState createState() => _DocumentListScreenState();
}

class _DocumentListScreenState extends State<DocumentListScreen> {
  double itemGapSize = 8.0;
  double itemBlocGapSize = 16.0;

  List<String> title = ['title1 ', 'title2', 'title3'];
  List<String> description = ['description1 ', 'description2', 'description3'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Stack(
        children: [
          ImageContainer(),
          TopGreenContainer(context),
          ItemsContainer()
        ],
      ),
    )));
  }

  Widget ItemsContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            TopElementsOfContainer(),
            MiddleElementsOfContainerCompany(),
            RegistrationContainer(),
          ],
        ),
      ),
    );
  }

  Widget MiddleElementsOfContainerCompany() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        E_comRegistrationSizedVerticalBox(itemBlocGapSize),
        E_comRegistrationHeadings('E-COM'),
        E_comRegistrationHeadings('REGISTRATION'),
      ],
    );
  }

  Widget RegistrationContainer() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 34.0, horizontal: 4),
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DocumentListDetailScreen(
                                title: title[index],
                                description: description[index],
                              )));
                },
                leading: Image.asset(
                  'assets/esewa_logo.png',
                  height: 60,
                  width: 40.0,
                ),
                title: Text(title[index]),
                subtitle: Text(description[index]),
                trailing: E_comRegistrationNormalText(
                    'Verify', TextDecoration.underline),
              );
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
