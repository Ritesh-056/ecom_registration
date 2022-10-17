import 'package:ecom_registration/utils/functions/resuable_functions.dart';
import 'package:ecom_registration/widgets/reusable_widgets.dart';
import 'package:flutter/material.dart';

import '../../../app_const.dart';
import '../details_constant.dart';

Widget FooterElementsOfContainer() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            SubmittedDetailConstant.projectByBelow,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text(
            SubmittedDetailConstant.projectByBelow,
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
              SubmittedDetailConstant.NepalGovernmentStr,
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
              SubmittedDetailConstant.labelText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 32.0),
          Expanded(
            child: Text(
              SubmittedDetailConstant.submittedBody,
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