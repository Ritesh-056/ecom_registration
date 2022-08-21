import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/resources/widgets/master_widgets.dart';
import 'package:ecom_registration/resources/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

class UserDetailResponseScreen extends StatelessWidget {
  const UserDetailResponseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      child: Container(
        child: Stack(
          children: [
            ImageContainer(),
            TopGreenContainer(context),
            ItemsContainer(context)
          ],
        ),
      ),
    )));
  }

  Widget FooterElementsOfContainer() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
                'Project By: Ritesh Baral, Heena Shrestha, Yojan Shakya,',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Text('Ronish bajracharya',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ]);
  }

  Widget ItemsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TopElementsOfContainer(),
          MiddleElementsOfContainerCompany(),
          ResponseContainer(context),
          SizedBox(
            height: 32.0,
          ),
          FooterElementsOfContainer(),
        ],
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

  Widget ResponseContainer(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: EdgeInsets.symmetric(vertical: 34.0, horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 32.0),
            Center(child: E_comRegistrationTextHeading('Thank You')),
            SizedBox(
              height: 8.0,
            ),
            Center(child: Text('Your details have been submitted !')),
            SizedBox(height: 32.0),
            Expanded(
                child: Text(
                    "Dear, user your details and documents are submitted successfully into the database of the Nepal Government. Your documents need to be verified by the central authority which takes some time to verify. If completed you will be inform soon with an email.")),
            Row(
              children: [
                Image.asset(
                  'assets/logo_nepal.png',
                  height: 100,
                  width: 80,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text('Nepal Government')
              ],
            )
          ]),
        ));
  }
}
