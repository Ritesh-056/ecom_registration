import 'package:ecom_registration/const.dart';
import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import '../../widgets/reusable_widgets.dart';
import '../widgets/master_widgets.dart';

import 'package:flutter/material.dart';


class UserDetailResponseScreen extends StatelessWidget {
  const UserDetailResponseScreen({Key? key})
      : super(
          key: key,
        );

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
        ),
      ),
    );
  }

  Widget FooterElementsOfContainer() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Project By: Yojan Shakya, Ritesh Baral, Heena Shrestha',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'Ronish bajracharya',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]);
  }

  Widget ItemsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MiddleElementsOfContainerCompany(),
          ResponseContainer(context),
          SizedBox(
            height: 32.0,
          ),
          FooterElementsOfContainer(),
          SizedBox(
            height: 60.0,
          ),
          GestureDetector(
            onTap: () {
              E_comRegistrationShowAlertDialog(context);
            },
            child: E_comRegistrationLoginOrRegisterButton(
              'Close',
              context,
            ),
          ),
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
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 34.0, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/logo_nepal.png',
                height: 100,
                width: 80,
              ),
            ),
            Center(
              child: Text(
                'Nepal Government',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Center(
              child: E_comRegistrationTextHeading('Thank You !'),
            ),
            Center(
              child: Text(
                'Your details have been submitted.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: Text(
                response_str,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black87.withOpacity(0.7),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
